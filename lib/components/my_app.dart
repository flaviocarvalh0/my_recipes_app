import 'package:flutter/material.dart';
import 'package:my_recipes_app/data/dummy_data.dart';
import 'package:my_recipes_app/models/meal.dart';
import 'package:my_recipes_app/models/settings.dart';
import 'package:my_recipes_app/routes/app_routes.dart';
import 'package:my_recipes_app/screens/categories_meals_screen.dart';
import 'package:my_recipes_app/screens/home_screen.dart';
import 'package:my_recipes_app/screens/meal_details_screen.dart';
import 'package:my_recipes_app/screens/setting_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];
  Settings settings = Settings();

  void _filtredMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme:
            const ColorScheme.light().copyWith(secondary: Colors.amber),
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
        AppRoutes.HOME: (context) => HomeScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAILS: (context) =>
            MealDetailsScreen(_toggleFavoriteMeal, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingScreen(settings, _filtredMeals)
      },
    );
  }
}
