import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/meal_item.dart';
import 'package:my_recipes_app/data/dummy_data.dart';
import 'package:my_recipes_app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: category.color,
          title: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return MealItem(categoryMeals[index]);
            }));
  }
}
