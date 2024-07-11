import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavouritesMealNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
      // _showInfoMessage('Meal is no longer a favourite');
    } else {
      state = [...state, meal];
      return true;
      // _showInfoMessage('Marked as a favourite');
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritesMealNotifier, List<Meal>>((ref) {
  return FavouritesMealNotifier();
});
