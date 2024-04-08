import 'package:http/http.dart' as http;

import 'api_client.dart';
import 'api_constants.dart';
import 'cache_manager.dart';

class SpoonacularApiService {
  final ApiClient _apiClient;
  final CacheManager _cacheManager;

  SpoonacularApiService(this._apiClient, this._cacheManager);

  Future<dynamic> searchIngredients(String query, {int number = 10}) async {
    final cacheKey = 'ingredients_search_$query';
    final cachedData = _cacheManager.getFromCache(cacheKey);

    if (cachedData != null) {
      return cachedData;
    }

    final queryParams = {
      'query': query,
      'number': number.toString(),
    };

    final response = await _apiClient.get(
      ApiConstants.ingredientsSearchEndpoint,
      queryParams: queryParams,
    );

    _cacheManager.putInCache(cacheKey, response);

    return response;
  }

  Future<dynamic> searchRecipes(
    List<String> ingredients, {
    int number = 10,
    String cuisine = '',
    String diet = '',
    String intolerances = '',
    String type = '',
  }) async {
    final cacheKey = 'recipes_search_${ingredients.join(',')}';
    final cachedData = _cacheManager.getFromCache(cacheKey);

    if (cachedData != null) {
      return cachedData;
    }

    final queryParams = {
      'ingredients': ingredients.join(','),
      'number': number.toString(),
      if (cuisine.isNotEmpty) 'cuisine': cuisine,
      if (diet.isNotEmpty) 'diet': diet,
      if (intolerances.isNotEmpty) 'intolerances': intolerances,
      if (type.isNotEmpty) 'type': type,
    };

    final response = await _apiClient.get(
      ApiConstants.recipesComplexSearchEndpoint,
      queryParams: queryParams,
    );

    _cacheManager.putInCache(cacheKey, response);

    return response;
  }

  Future<dynamic> getRecipeInformation(String recipeId) async {
    final cacheKey = 'recipe_information_$recipeId';
    final cachedData = _cacheManager.getFromCache(cacheKey);

    if (cachedData != null) {
      return cachedData;
    }

    final endpoint = ApiConstants.recipeInformationEndpoint.replaceAll('{id}', recipeId);

    final response = await _apiClient.get(endpoint);

    _cacheManager.putInCache(cacheKey, response);

    return response;
  }
}