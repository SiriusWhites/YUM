import 'package:yum/models/ingredient.dart';

class GroceryItem {
  final Ingredient ingredient;
  bool checked;

  GroceryItem({
    required this.ingredient,
    this.checked = false,
  });
}
