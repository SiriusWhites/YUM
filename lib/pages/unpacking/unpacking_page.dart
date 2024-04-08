import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/models/ingredient.dart';
import 'package:yum/services/ingredient_service.dart';

class UnpackingPage extends StatefulWidget {
  const UnpackingPage({Key? key}) : super(key: key);

  @override
  UnpackingPageState createState() => UnpackingPageState();
}

class UnpackingPageState extends State<UnpackingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _amountController;
  late TextEditingController _unitController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _categoryController = TextEditingController();
    _amountController = TextEditingController();
    _unitController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _amountController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    if (_formKey.currentState!.validate()) {
      final ingredient = Ingredient(
        name: _nameController.text,
        category: _categoryController.text,
        amount: double.parse(_amountController.text),
        unit: _unitController.text,
      );
      Provider.of<IngredientService>(context, listen: false)
          .createIngredient(ingredient)
          .then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unpack Ingredients'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredient name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredient category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredient amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'Unit'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredient unit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addIngredient,
                child: const Text('Add Ingredient'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}