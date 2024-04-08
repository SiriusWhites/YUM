import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yum/models/ingredient.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logger/logger.dart';
import 'package:yum/services/spoonacular_api_service.dart';

class IngredientService {
  final SpoonacularApiService apiService;
  final Logger logger;

  IngredientService({
    required this.apiService,
    required this.logger,
  });

  Future<List<Ingredient>> searchIngredients(String query) async {
    final response = await apiService.get(
      '/food/ingredients/search',
      queryParameters: {'query': query, 'apiKey': apiService.apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final ingredients = List<Map<String, dynamic>>.from(data['results']);
      return ingredients.map((ingredient) {
        return Ingredient(
          name: ingredient['name'],
          imageUrl: '${apiService.baseUrl}/cdn/ingredients_100x100/${ingredient['image']}',
          amount: 0,
          unit: Unit(name: '', abbreviation: ''),
          expirationDate: DateTime.now(),
          storageLocation: '',
        );
      }).toList();
    } else {
      logger.e('Failed to search ingredients. Status code: ${response.statusCode}');
      throw Exception('Failed to search ingredients');
    }
  }

  Future<void> removeIngredient(Ingredient ingredient) async {
    final response = await apiService.delete(
      '/food/ingredients/${ingredient.hashCode}/information',
      queryParameters: {'apiKey': apiService.apiKey},
    );

    if (response.statusCode == 200) {
      logger.d('Ingredient removed: ${ingredient.name}');
    } else {
      logger.e('Failed to remove ingredient: ${ingredient.name}. Status code: ${response.statusCode}');
      throw Exception('Failed to remove ingredient');
    }
  }

  Future<void> cacheIngredientImage(String imageUrl) async {
    try {
      final cacheManager = DefaultCacheManager();
      await cacheManager.downloadFile(imageUrl);
      logger.d('Ingredient image cached: $imageUrl');
    } catch (e) {
      logger.e('Failed to cache ingredient image: $imageUrl, Error: $e');
    }
  }
}