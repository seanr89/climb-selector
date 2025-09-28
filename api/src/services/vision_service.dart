
import 'dart:convert';
import 'dart:typed_data';

import 'package:google_vision/google_vision.dart';
import 'package:googleapis_auth/auth_io.dart';

class VisionService {
  VisionService();

  Future<List<Map<String, double>>> findOrangeHolds(Uint8List imageData) async {
    // TODO: Replace with your actual credentials
    final credentials = ServiceAccountCredentials.fromJson(json.decode(const String.fromEnvironment('GOOGLE_CREDENTIALS')));
    final client = await clientViaServiceAccount(credentials, [VisionApi.cloudVisionScope]);
    final vision = VisionApi(client);

    final image = VisionImage();
    image.content = base64Encode(imageData);

    final request = AnnotateImageRequest();
    request.image = image;
    request.features = [
      Feature()
        ..type = 'OBJECT_LOCALIZATION'
        ..maxResults = 50,
      Feature()
        ..type = 'IMAGE_PROPERTIES'
        ..maxResults = 50,
    ];

    final response = await vision.images.annotate(AnnotateImagesRequest()..requests = [request]);

    final orangeHolds = <Map<String, double>>[];

    for (final localizedObjectAnnotation in response.responses.first.localizedObjectAnnotations) {
      if (localizedObjectAnnotation.name == 'Orange') {
        final vertices = localizedObjectAnnotation.boundingPoly.normalizedVertices;
        if (vertices.length == 4) {
          orangeHolds.add({
            'x1': vertices[0].x,
            'y1': vertices[0].y,
            'x2': vertices[2].x,
            'y2': vertices[2].y,
          });
        }
      }
    }

    return orangeHolds;
  }
}
