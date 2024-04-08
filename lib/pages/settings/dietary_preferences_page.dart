import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/services/user_preferences_service.dart';

class DietaryPreferencesPage extends StatefulWidget {
  @override
  _DietaryPreferencesPageState createState() => _DietaryPreferencesPageState();
}

class _DietaryPreferencesPageState extends State<DietaryPreferencesPage> {
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isGlutenFree = false;
  bool _isDairyFree = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() {
    final userPreferencesService = Provider.of<UserPreferencesService>(context, listen: false);
    setState(() {
      _isVegetarian = userPreferencesService.isVegetarian;
      _isVegan = userPreferencesService.isVegan;
      _isGlutenFree = userPreferencesService.isGlutenFree;
      _isDairyFree = userPreferencesService.isDairyFree;
    });
  }

  void _savePreferences() {
    final userPreferencesService = Provider.of<UserPreferencesService>(context, listen: false);
    userPreferencesService.updateDietaryPreferences(
      isVegetarian: _isVegetarian,
      isVegan: _isVegan,
      isGlutenFree: _isGlutenFree,
      isDairyFree: _isDairyFree,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dietary Preferences'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Vegetarian'),
            value: _isVegetarian,
            onChanged: (value) {
              setState(() {
                _isVegetarian = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Vegan'),
            value: _isVegan,
            onChanged: (value) {
              setState(() {
                _isVegan = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Gluten-Free'),
            value: _isGlutenFree,
            onChanged: (value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dairy-Free'),
            value: _isDairyFree,
            onChanged: (value) {
              setState(() {
                _isDairyFree = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: _savePreferences,
            child: Text('Save Preferences'),
          ),
        ],
      ),
    );
  }
}