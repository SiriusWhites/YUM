import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/grocery_list.dart';
import 'package:yum/services/grocery_list_service.dart';
import 'package:yum/widgets/grocery_list_item.dart';

class GroceryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: FutureBuilder<GroceryList>(
        future: Provider.of<GroceryListService>(context, listen: false).getGroceryList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final groceryList = snapshot.data;
          return ListView.builder(
            itemCount: groceryList?.items.length ?? 0,
            itemBuilder: (context, index) {
              final groceryItem = groceryList!.items[index];
              return GroceryListItem(
                groceryItem: groceryItem,
                onTap: () {
                  // Navigate to grocery item details page
                },
              );
            },
          );
        },
      ),
    );
  }
}