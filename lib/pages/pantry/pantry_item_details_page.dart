import 'package:flutter/material.dart';
import 'package:yum/models/ingredient.dart';
import 'package:yum/services/ingredient_service.dart';

class PantryItemDetailsPage extends StatelessWidget {
  final Ingredient ingredient;

  const PantryItemDetailsPage({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              ingredient.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              ingredient.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text(
              'Amount: ${ingredient.amount} ${ingredient.unit}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            Text(
              'Expiration Date: ${ingredient.expirationDate}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            Text(
              'Storage Location: ${ingredient.storageLocation}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Remove Ingredient'),
                    content: Text('Are you sure you want to remove this ingredient from your pantry?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          IngredientService().removeIngredient(ingredient);
                          Navigator.popUntil(context, ModalRoute.withName('/pantry'));
                        },
                        child: Text('Remove'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Remove from Pantry'),
            ),
          ],
        ),
      ),
    );
  }
}