import 'package:flutter/material.dart';
import 'package:yum/models/recipe.dart';
import 'package:yum/widgets/ingredient_list_item.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Ready in ${recipe.readyInMinutes} minutes',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ingredients:',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recipe.ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = recipe.ingredients[index];
                      return IngredientListItem(ingredient: ingredient);
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Instructions:',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 8.0),
                  Text(recipe.instructions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}