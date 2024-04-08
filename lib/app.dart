import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/routes.dart';
import 'package:yum/services/grocery_list_service.dart';
import 'package:yum/services/ingredient_service.dart';
import 'package:yum/services/recipe_service.dart';
import 'package:yum/services/spoonacular_api_service.dart';
import 'package:yum/services/user_preferences_service.dart';

class YumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SpoonacularApiService>(
          create: (_) => SpoonacularApiService(),
        ),
        Provider<IngredientService>(
          create: (_) => IngredientService(),
        ),
        Provider<RecipeService>(
          create: (context) => RecipeService(
            context.read<SpoonacularApiService>(),
          ),
        ),
        Provider<UserPreferencesService>(
          create: (_) => UserPreferencesService(),
        ),
        Provider<GroceryListService>(
          create: (_) => GroceryListService(),
        ),
      ],
      child: MaterialApp(
        title: 'Yum',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}