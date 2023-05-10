import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/main_drawer.dart';
import 'package:my_recipes_app/models/meal.dart';
import 'package:my_recipes_app/screens/categories_screen.dart';
import 'package:my_recipes_app/screens/favorities_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> meals;
  

  const HomeScreen(this.meals, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, dynamic>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
      {'title': 'Meus Favoritos', 'screen': FavoritiesScreen(widget.meals)},
    ];
  }

  void onTap(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _screens[_selectedScreenIndex]['title'] as String,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
