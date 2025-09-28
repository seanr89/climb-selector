import 'dart:typed_data';

import 'package:app/services/api_client.dart';
import 'package:flutter/material.dart';

class ImageCaptureScreen extends StatefulWidget {
  const ImageCaptureScreen({super.key});

  @override
  State<ImageCaptureScreen> createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  final ApiClient _apiClient = ApiClient();

  Future<void> _takePicture() async {
    // Placeholder for image data
    final imageData = Uint8List(0);
    try {
      await _apiClient.uploadImage(imageData);
      // Navigate to the route display screen
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClimbRoute AI')),
      body: Center(
        child: ElevatedButton(
          onPressed: _takePicture,
          child: const Text('Take Picture'),
        ),
      ),
    );
  }
}
