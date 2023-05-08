import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/main_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Configurções',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
