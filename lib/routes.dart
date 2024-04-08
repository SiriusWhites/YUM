import 'package:flutter/material.dart';
import 'package:yum/pages/category/category_page.dart';
import 'package:yum/pages/favorites/favorites_page.dart';
import 'package:yum/pages/grocery_list/grocery_list_page.dart';
import 'package:yum/pages/pantry/pantry_item_details_page.dart';
import 'package:yum/pages/pantry/pantry_page.dart';
import 'package:yum/pages/recipes/recipe_details_page.dart';
import 'package:yum/pages/recipes/recipe_filters_page.dart';
import 'package:yum/pages/recipes/recipes_page.dart';
import 'package:yum/pages/settings/dietary_preferences_page.dart';
import 'package:yum/pages/settings/settings_page.dart';
import 'package:yum/pages/unpacking/unpacking_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => UnpackingPage());
      case '/category':
        return MaterialPageRoute(builder: (_) => CategoryPage());
      case '/pantry':
        return MaterialPageRoute(builder: (_) => PantryPage());
      case '/pantry-item-details':
        return MaterialPageRoute(
          builder: (_) => PantryItemDetailsPage(
            ingredient: settings.arguments as Ingredient,
          ),
        );
      case '/recipes':
        return MaterialPageRoute(builder: (_) => RecipesPage());
      case '/recipe-filters':
        return MaterialPageRoute(builder: (_) => RecipeFiltersPage());
      case '/recipe-details':
        return MaterialPageRoute(
          builder: (_) => RecipeDetailsPage(
            recipe: settings.arguments as Recipe,
          ),
        );
      case '/favorites':
        return MaterialPageRoute(builder: (_) => FavoritesPage());
      case '/grocery-list':
        return MaterialPageRoute(builder: (_) => GroceryListPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/dietary-preferences':
        return MaterialPageRoute(builder: (_) => DietaryPreferencesPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}