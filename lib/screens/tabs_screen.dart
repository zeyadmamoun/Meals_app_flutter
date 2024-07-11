import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourites_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/providers/nav_bar_provider.dart';
import 'package:meal_app/screens/categories_screens.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      avilableMeals: availableMeals,
    );
    var activeTitle = 'Pick your category';

    final selectedPageIndex = ref.watch(navBarProvider);

    if (selectedPageIndex == 1) {
      final List<Meal> favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activeTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: (String route) {
          Navigator.of(context).pop();
          if (route == "filters") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FiltersScreen(),
              ),
            );
          }
        },
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
