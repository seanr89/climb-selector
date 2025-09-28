
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:my_api/src/services/vision_service.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final formData = await context.request.formData();
    final file = formData.files['file'];
    if (file == null) {
      return Response(statusCode: HttpStatus.badRequest, body: 'No file uploaded');
    }
    final imageData = await file.readAsBytes();
    final visionService = VisionService();
    try {
      final orangeHolds = await visionService.findOrangeHolds(imageData);
      return Response.json(body: orangeHolds);
    } catch (e) {
      return Response(statusCode: HttpStatus.internalServerError, body: e.toString());
    }
  }
  return Response(statusCode: HttpStatus.methodNotAllowed);
}
