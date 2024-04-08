import 'ingredient.dart';

class Cuisine {
  final String name;
  final String description;
  
  Cuisine({required this.name, required this.description});
}

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final int readyInMinutes;
  final int servings;
  final List<Cuisine> cuisines;
  final List<String> dishTypes;
  final List<Ingredient> ingredients;
  final String instructions;
  
  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.readyInMinutes,
    required this.servings,
    required this.cuisines,
    required this.dishTypes,
    required this.ingredients,
    required this.instructions,
  });
  
  double getTotalCookingTime() {
    // Calculate total cooking time based on readyInMinutes and other factors
    return readyInMinutes.toDouble();
  }
  
  List<Ingredient> getScaledIngredients(int newServings) {
    // Scale the ingredient amounts based on the new number of servings
    return ingredients.map((ingredient) {
      return Ingredient(
        name: ingredient.name,
        imageUrl: ingredient.imageUrl,
        amount: ingredient.amount * (newServings / servings),
        unit: ingredient.unit,
        expirationDate: ingredient.expirationDate, // Add the expirationDate argument
        storageLocation: ingredient.storageLocation, // Add the storageLocation argument
      );
    }).toList();
  }
}