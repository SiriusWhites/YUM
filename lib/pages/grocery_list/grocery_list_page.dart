import 'package:flutter/material.dart';
import '../../models/grocery_item.dart';
import '../../widgets/grocery_list_item_widget.dart';

class GroceryListPage extends StatelessWidget {
  final List<GroceryItem> groceryItems;

  const GroceryListPage({super.key, required this.groceryItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final groceryItem = groceryItems[index];
          return GroceryListItemWidget(
            groceryItem: groceryItem,
            onCheckedChanged: (checked) {
              // Handle the checked state change if needed
            },
          );
        },
      ),
    );
  }
}