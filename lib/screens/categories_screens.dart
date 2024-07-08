import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 7 / 6,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onToggleFavourite: onToggleFavourite,
            )
        ],
      ),
    );
  }
}
