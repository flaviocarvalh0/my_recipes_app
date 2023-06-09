import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/main_drawer.dart';

import '../models/settings.dart';

class SettingScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final settings;

  const SettingScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Exibir apenas refeições sem glutén.',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Exibir apenas refeições sem lactose.',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Exibir apenas refeições vegetarianas.',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Exibir apenas refeições veganas.',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
