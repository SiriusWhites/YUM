import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/services/recipe_service.dart';

class RecipeFiltersPage extends StatefulWidget {
  const RecipeFiltersPage({super.key});

  @override
  _RecipeFiltersPageState createState() => _RecipeFiltersPageState();
}

class _RecipeFiltersPageState extends State<RecipeFiltersPage> {
  String _selectedCuisine = '';
  String _selectedDiet = '';
  String _selectedIntolerances = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Filters'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Cuisine'),
            trailing: DropdownButton<String>(
              value: _selectedCuisine,
              onChanged: (value) {
                setState(() {
                  _selectedCuisine = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Italian', child: Text('Italian')),
                DropdownMenuItem(value: 'Mexican', child: Text('Mexican')),
              ],
            ),
          ),
          ListTile(
            title: const Text('Diet'),
            trailing: DropdownButton<String>(
              value: _selectedDiet,
              onChanged: (value) {
                setState(() {
                  _selectedDiet = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Vegetarian', child: Text('Vegetarian')),
                DropdownMenuItem(value: 'Vegan', child: Text('Vegan')),
              ],
            ),
          ),
          ListTile(
            title: const Text('Intolerances'),
            trailing: DropdownButton<String>(
              value: _selectedIntolerances,
              onChanged: (value) {
                setState(() {
                  _selectedIntolerances = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Dairy', child: Text('Dairy')),
                DropdownMenuItem(value: 'Gluten', child: Text('Gluten')),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final recipeService = context.read<RecipeService>();
              recipeService.updateFilters(
                cuisine: _selectedCuisine,
                diet: _selectedDiet,
                intolerances: _selectedIntolerances,
              );
              Navigator.pop(context);
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}