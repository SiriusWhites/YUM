import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'api_exceptions.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$endpoint')
        .replace(queryParameters: queryParams);

    final response = await _client.get(uri, headers: ApiConstants.headersWithApiKey);

    return _handleResponse(response);
  }

  Future<dynamic> _handleResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw ApiException('Bad Request', response.statusCode);
      case 401:
        throw ApiException('Unauthorized', response.statusCode);
      case 404:
        throw ApiException('Not Found', response.statusCode);
      case 500:
        throw ApiException('Internal Server Error', response.statusCode);
      default:
        throw ApiException('Something went wrong', response.statusCode);
    }
  }
}