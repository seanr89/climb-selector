
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String _baseUrl = 'http://localhost:8080';

  Future<void> uploadImage(Uint8List imageData) async {
    final uri = Uri.parse('$_baseUrl/images');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromBytes('file', imageData));
    final response = await _httpClient.send(request);
    if (response.statusCode != 201) {
      throw Exception('Failed to upload image');
    }
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
