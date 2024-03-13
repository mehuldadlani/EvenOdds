import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));

    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = json.decode(response.body);
    log('Response: $body');
    if (statusCode >= 200 && statusCode < 300) {
      return {'success': true, 'data': body};
    } else {
      return {'success': false, 'error': body['message'] ?? 'Unknown error'};
    }
  }
}
