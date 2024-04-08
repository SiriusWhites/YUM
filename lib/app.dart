import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:yum/routes.dart';
import 'package:yum/services/grocery_list_service.dart';
import 'package:yum/services/ingredient_service.dart' as ingredient_service;
import 'package:yum/services/spoonacular_api_service.dart';
import 'package:yum/services/user_preferences_service.dart';

class YumApp extends StatelessWidget {
  const YumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SpoonacularApiService>(
          create: (_) => SpoonacularApiService(
            apiKey: 'your_api_key_here',
            baseUrl: 'https://api.spoonacular.com',
            logger: Logger(),
          ),
        ),
        Provider<ingredient_service.IngredientService>(
          create: (context) => ingredient_service.IngredientService(
            apiService: context.read<SpoonacularApiService>(),
            logger: Logger(),
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