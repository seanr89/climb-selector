import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String _baseUrl = 'http://localhost:8080';

  Future<List<Map<String, dynamic>>> uploadImage(Uint8List imageData) async {
    print('uploading image');
    final uri = Uri.parse('$_baseUrl/images');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromBytes('file', imageData));
    final response = await _httpClient.send(request);
    if (response.statusCode != 200) {
      throw Exception('Failed to upload image');
    }
    final responseBody = await response.stream.bytesToString();
    return List<Map<String, dynamic>>.from(json.decode(responseBody) as List);
  }

  Future<List<String>> getRoutes(String imageId) async {
    final uri = Uri.parse('$_baseUrl/images/$imageId/routes');
    final response = await _httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to get routes');
    }
    return List<String>.from(json.decode(response.body) as List);
  }

  Future<void> getRouteForColor(String imageId, String color) async {
    final uri = Uri.parse('$_baseUrl/images/$imageId/routes/$color');
    final response = await _httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to get route for color');
    }
  }
}
