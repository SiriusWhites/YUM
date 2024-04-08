import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yum/models/ingredient.dart';
import 'package:yum/models/recipe.dart';
import 'package:flutter/material.dart';

class IngredientService {
  final String apiKey;
  final String baseUrl;

  IngredientService({
    required this.apiKey,
    required this.baseUrl,
  });

  Future<List<Ingredient>> searchIngredients(String query) async {
    final url = '$baseUrl/food/ingredients/search?query=$query&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final ingredients = List<Map<String, dynamic>>.from(data['results']);
      return ingredients.map((ingredient) {
        return Ingredient(
          name: ingredient['name'],
          imageUrl: '$baseUrl/cdn/ingredients_100x100/${ingredient['image']}',
          amount: 0,
          unit: Unit(name: '', abbreviation: ''),
          expirationDate: DateTime.now(),
          storageLocation: '',
        );
      }).toList();
    } else {
      throw Exception('Failed to search ingredients');
    }
  }

  void removeIngredient(Ingredient ingredient) {
    // Implement the logic to remove the ingredient from the pantry
    // using the apiKey and baseUrl
    // For example, you can make an API call to remove the ingredient
    // from the backend or update the local state management
    // to remove the ingredient from the pantry
    // Here's a placeholder implementation:
    print('Removing ingredient: ${ingredient.name}');
  }
}

class RecipeService extends ChangeNotifier {
  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void removeRecipe(Recipe recipe) {
    _recipes.remove(recipe);
    notifyListeners();
  }

  void updateFilters({
    String? cuisine,
    String? diet,
    String? intolerances,
  }) {
    // Implement filter logic here
    // Update the _recipes list based on the provided filters
    notifyListeners();
  }

  Future<List<Recipe>> getRecipes() async {
    // Fetch recipes from an API or local storage
    // Return a list of Recipe objects
    return _recipes;
  }
}