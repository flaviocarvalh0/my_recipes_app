import 'package:flutter/material.dart';
import 'package:my_recipes_app/screens/categories_meals_screen.dart';
import 'package:my_recipes_app/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String HOME = '/';
  static const String CATEGORIES_MEALS = '/categoriesMeals';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        HOME: (context) => const HomeScreen(),
        CATEGORIES_MEALS: (context) => const CategoriesMealsScreen()
      },
    );
  }
}
