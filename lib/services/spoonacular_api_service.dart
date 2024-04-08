import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class SpoonacularApiService {
  final String apiKey;
  final String baseUrl;
  final Logger logger;

  SpoonacularApiService({
    required this.apiKey,
    required this.baseUrl,
    required this.logger,
  });

  Future<http.Response> get(String path, {Map<String, String>? queryParameters}) async {
    final url = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
    logger.d('GET request: $url');
    final response = await http.get(url);
    logger.d('Response status code: ${response.statusCode}');
    return response;
  }

  Future<http.Response> delete(String path, {Map<String, String>? queryParameters}) async {
    final url = Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
    logger.d('DELETE request: $url');
    final response = await http.delete(url);
    logger.d('Response status code: ${response.statusCode}');
    return response;
  }
}