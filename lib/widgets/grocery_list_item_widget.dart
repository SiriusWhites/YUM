import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryListItemWidget extends StatelessWidget {
  final GroceryItem groceryItem;
  final Function(bool?)? onCheckedChanged;

  const GroceryListItemWidget({
    Key? key,
    required this.groceryItem,
    this.onCheckedChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.ingredient.name),
      trailing: Checkbox(
        value: groceryItem.checked,
        onChanged: onCheckedChanged,
      ),
    );
  }
}