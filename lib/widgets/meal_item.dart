import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 6,
                ),
                color: Colors.black38,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.schedule),
                          Text(
                            meal.duration.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.shopping_bag),
                          Text(
                            meal.complexity.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.money),
                          Text(
                            meal.affordability.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
