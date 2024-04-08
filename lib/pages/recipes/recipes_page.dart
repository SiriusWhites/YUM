import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/recipe.dart';
import 'package:yum/services/recipe_service.dart';
import 'package:yum/widgets/recipe_list_item.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: Provider.of<RecipeService>(context, listen: false).getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final recipes = snapshot.data;
          return ListView.builder(
            itemCount: recipes?.length ?? 0,
            itemBuilder: (context, index) {
              final recipe = recipes![index];
              return RecipeListItem(
                recipe: recipe,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/recipe-details',
                    arguments: recipe,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}