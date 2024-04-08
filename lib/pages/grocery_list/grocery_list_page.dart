import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/services/grocery_list_service.dart';
import 'package:yum/widgets/grocery_list_item_widget.dart';

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({super.key}); // Updated to use super parameter for `key`

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: Consumer<GroceryListService>(
        builder: (context, service, child) {
          var groceryItems = service.getGroceryItems(); // This method is now correctly defined in GroceryListService
          return ListView.builder(
            itemCount: groceryItems.length,
            itemBuilder: (context, index) {
              final ingredient = groceryItems[index];
              return GroceryListItemWidget(
                item: ingredient, // Assuming GroceryListItemWidget can handle an Ingredient model directly or adjustments are made to accept this model
                onChecked: () {
                  // Implement check action here
                },
                onRemoved: () {
                  // Implement remove action here
                },
              );
            },
          );
        },
      ),
    );
  }
}
