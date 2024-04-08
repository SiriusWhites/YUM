import 'package:flutter/material.dart';
import 'package:yum/models/ingredient.dart';
import 'package:yum/services/ingredient_service.dart';

class CategoryPage extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategoryPage({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: FutureBuilder<List<String>>(
        future: IngredientService().getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final categories = snapshot.data;
          return ListView.builder(
            itemCount: categories?.length ?? 0,
            itemBuilder: (context, index) {
              final category = categories![index];
              return ListTile(
                title: Text(category),
                onTap: () {
                  onCategorySelected(category);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}