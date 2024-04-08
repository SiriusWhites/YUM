import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/services/recipe_service.dart';

class RecipeFiltersPage extends StatefulWidget {
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
        title: Text('Recipe Filters'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Cuisine'),
            trailing: DropdownButton<String>(
              value: _selectedCuisine,
              onChanged: (value) {
                setState(() {
                  _selectedCuisine = value!;
                });
              },
              items: [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Italian', child: Text('Italian')),
                DropdownMenuItem(value: 'Mexican', child: Text('Mexican')),
                // Add more cuisine options as needed
              ],
            ),
          ),
          ListTile(
            title: Text('Diet'),
            trailing: DropdownButton<String>(
              value: _selectedDiet,
              onChanged: (value) {
                setState(() {
                  _selectedDiet = value!;
                });
              },
              items: [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Vegetarian', child: Text('Vegetarian')),
                DropdownMenuItem(value: 'Vegan', child: Text('Vegan')),
                // Add more diet options as needed
              ],
            ),
          ),
          ListTile(
            title: Text('Intolerances'),
            trailing: DropdownButton<String>(
              value: _selectedIntolerances,
              onChanged: (value) {
                setState(() {
                  _selectedIntolerances = value!;
                });
              },
              items: [
                DropdownMenuItem(value: '', child: Text('None')),
                DropdownMenuItem(value: 'Dairy', child: Text('Dairy')),
                DropdownMenuItem(value: 'Gluten', child: Text('Gluten')),
                // Add more intolerance options as needed
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final recipeService = Provider.of<RecipeService>(context, listen: false);
              recipeService.updateFilters(
                cuisine: _selectedCuisine,
                diet: _selectedDiet,
                intolerances: _selectedIntolerances,
              );
              Navigator.pop(context);
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}