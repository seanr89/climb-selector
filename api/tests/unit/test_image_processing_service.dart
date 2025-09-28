
import 'dart:typed_data';

import '../../src/services/image_processing_service.dart';
import 'package:test/test.dart';

void main() {
  group('ImageProcessingService', () {
    test('detectColors returns a list of strings', () async {
      final service = ImageProcessingService();
      final colors = await service.detectColors(Uint8List(0));
      expect(colors, isA<List<String>>());
    });
  });
}
