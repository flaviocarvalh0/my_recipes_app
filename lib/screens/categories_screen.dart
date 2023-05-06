import 'package:flutter/material.dart';
import 'package:my_recipes_app/components/category.item.dart';
import 'package:my_recipes_app/data/dummy_data.dart';

class CategorysScreen extends StatelessWidget {
  const CategorysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories.map((e) {
          return CategoryItem(e);
        }).toList(),
      ),
    );
  }
}
