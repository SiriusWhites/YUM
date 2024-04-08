import '../models/ingredient.dart';
import '../models/grocery_list.dart';

class GroceryListService {
  final GroceryList _groceryList = GroceryList(ingredients: []);

  GroceryList get groceryList => _groceryList;

  void addIngredient(Ingredient ingredient) {
    if (!_groceryList.ingredients.contains(ingredient)) {
      _groceryList.ingredients.add(ingredient);
    }
  }

  void removeIngredient(Ingredient ingredient) {
    _groceryList.ingredients.remove(ingredient);
  }

  void clearGroceryList() {
    _groceryList.ingredients.clear();
  }

  void populateGroceryListFromRecipe(
    List<Ingredient> recipeIngredients,
    List<Ingredient> pantryIngredients,
  ) {
    final missingIngredients = recipeIngredients
        .where((ingredient) => !pantryIngredients.contains(ingredient));
    _groceryList.ingredients.addAll(missingIngredients);
  }
}