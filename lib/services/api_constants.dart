class ApiConstants {
  static const String baseUrl = 'https://api.spoonacular.com';
  static const String apiKey = 'ad1246c269b9461e9376fad0beee61f8';

  static const String ingredientsSearchEndpoint = '/food/ingredients/search';
  static const String recipesComplexSearchEndpoint = '/recipes/complexSearch';
  static const String recipesFindByIngredientsEndpoint = '/recipes/findByIngredients';
  static const String recipeInformationEndpoint = '/recipes/{id}/information';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> get headersWithApiKey {
    return {
      ...headers,
      'x-api-key': apiKey,
    };
  }
}