
import 'dart:typed_data';

import 'package:app/services/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiClient', () {
    test('uploadImage throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final apiClient = ApiClient(httpClient: client);
      when(client.send(any)).thenAnswer((_) async => http.StreamedResponse(Stream.empty(), 404));
      expect(apiClient.uploadImage(Uint8List(0)), throwsException);
    });
  });
}
