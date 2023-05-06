import 'package:flutter/material.dart';
import 'package:my_recipes_app/screens/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Vamos conzinhar?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: const CategorysScreen(),
    );
  }
}
