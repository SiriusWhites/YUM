import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/ingredient.dart';
import 'package:yum/services/ingredient_service.dart';
import 'package:yum/services/spoonacular_api_service.dart';
import 'package:yum/widgets/ingredient_list_item.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key, this.widgetKey});

  final Key? widgetKey;

  @override
  PantryPageState createState() => PantryPageState();
}

class PantryPageState extends State<PantryPage> {
  late final IngredientService _ingredientService;
  List<Ingredient> _ingredients = [];
  String _searchQuery = '';
  final _logger = Logger();

  @override
  void initState() {
    super.initState();
    _initializeServices();
    _fetchPantryIngredients();
  }

  void _initializeServices() {
    final apiService = context.read<SpoonacularApiService>();
    _ingredientService = IngredientService(
      apiService: apiService,
      logger: Logger(),
    );
  }

  Future<void> _fetchPantryIngredients() async {
    try {
      final ingredients = await _ingredientService.searchIngredients(_searchQuery);
      setState(() {
        _ingredients = ingredients;
      });
    } catch (e, stackTrace) {
      _logger.e('Error fetching pantry ingredients', e, stackTrace);
    }
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
    _fetchPantryIngredients();
  }

  void _addNewIngredient() {
    // Implement logic to add a new ingredient
    // This may involve navigating to a separate page or displaying a modal
  }

  void _editIngredient(Ingredient ingredient) {
    // Implement logic to edit an ingredient
    // This may involve navigating to a separate page or displaying a modal
  }

  void _deleteIngredient(Ingredient ingredient) {
    // Implement logic to delete an ingredient
    // This may involve displaying a confirmation dialog and updating the ingredient list
    setState(() {
      _ingredients.remove(ingredient);
    });
    // Update the ingredient data source (e.g., IngredientService) accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
                showSearch(
                  context: context,
                  delegate: _PantrySearchDelegate(
                    initialQuery: _searchQuery,
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewIngredient,
          ),
        ],
      ),
      body: _ingredients.isNotEmpty
          ? ListView.builder(
              itemCount: _ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = _ingredients[index];
                return IngredientListItem(
                  ingredient: ingredient,
                  onEdit: () => _editIngredient(ingredient),
                  onDelete: () => _deleteIngredient(ingredient),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _PantrySearchDelegate extends SearchDelegate<void> {
  final String initialQuery;

  _PantrySearchDelegate({
    required this.initialQuery,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    PantryPageState state = context.findAncestorStateOfType<PantryPageState>()!;
    state._handleSearch(query);
    return const SizedBox.shrink(); // Return an empty widget
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}