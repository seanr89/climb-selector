import 'dart:typed_data';

import 'package:app/services/api_client.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCaptureScreen extends StatefulWidget {
  const ImageCaptureScreen({super.key});

  @override
  State<ImageCaptureScreen> createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  final ApiClient _apiClient = ApiClient();
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    _initializeControllerFuture = _cameraController!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      if (kIsWeb) {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery,
        );
        if (image != null) {
          print('loading image');
          final imageData = await image.readAsBytes();
          await _apiClient.uploadImage(imageData);
          // Navigate to the route display screen
        }
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        await _initializeControllerFuture;
        final image = await _cameraController!.takePicture();
        final imageData = await image.readAsBytes();
        await _apiClient.uploadImage(imageData);
        // Navigate to the route display screen
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClimbRoute AI')),
      body: Center(
        child: (kIsWeb || defaultTargetPlatform != TargetPlatform.android)
            ? ElevatedButton(
                onPressed: _takePicture,
                child: const Text('Select Image'),
              )
            : FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
      floatingActionButton:
          (kIsWeb || defaultTargetPlatform != TargetPlatform.android)
          ? null
          : FloatingActionButton(
              onPressed: _takePicture,
              child: const Icon(Icons.camera_alt),
            ),
    );
  }
}
