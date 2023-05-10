import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/meal_item.dart';

import '../models/meal.dart';

class FavoritiesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritiesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma refeição marcada como favorita.',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
