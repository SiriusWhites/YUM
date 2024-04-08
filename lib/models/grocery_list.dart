import '../models/ingredient.dart';

class GroceryList {
  final List<Ingredient> ingredients;

  GroceryList({required this.ingredients});

  void addIngredient(Ingredient ingredient) {
    // Add the ingredient to the list if it doesn't already exist
    if (!ingredients.contains(ingredient)) {
      ingredients.add(ingredient);
    }
  }

  void removeIngredient(Ingredient ingredient) {
    // Remove the ingredient from the list
    ingredients.remove(ingredient);
  }

  GroceryList copyWith({List<Ingredient>? ingredients}) {
    return GroceryList(
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroceryList &&
        other.ingredients.length == ingredients.length &&
        other.ingredients.every((ingredient) => ingredients.contains(ingredient));
  }

  @override
  int get hashCode => ingredients.hashCode;
}