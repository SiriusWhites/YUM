import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/recipe.dart';
import 'package:yum/services/recipe_service.dart';
import 'package:yum/widgets/recipe_list_item.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: Provider.of<RecipeService>(context, listen: false).getFavoriteRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final favoriteRecipes = snapshot.data;
          return ListView.builder(
            itemCount: favoriteRecipes?.length ?? 0,
            itemBuilder: (context, index) {
              final recipe = favoriteRecipes![index];
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