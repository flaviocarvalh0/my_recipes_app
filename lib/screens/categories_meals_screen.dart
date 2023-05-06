import 'package:flutter/material.dart';
import 'package:my_recipes_app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Text('recipes ${category.id}'),
      ),
    );
  }
}
