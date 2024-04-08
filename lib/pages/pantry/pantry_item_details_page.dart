import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/ingredient.dart';
import 'package:yum/services/ingredient_service.dart' as ingredient_service;

class PantryItemDetailsPage extends StatelessWidget {
  final Ingredient ingredient;

  const PantryItemDetailsPage({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    final ingredientService = context.read<ingredient_service.IngredientService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (rest of the code remains the same)
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Remove Ingredient'),
                    content: const Text(
                      'Are you sure you want to remove this ingredient from your pantry?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            await ingredientService.removeIngredient(ingredient);
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName('/pantry'),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text('Failed to remove ingredient: $e'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Remove'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Remove from Pantry'),
            ),
          ],
        ),
      ),
    );
  }
}