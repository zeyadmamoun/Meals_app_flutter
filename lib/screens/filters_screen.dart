import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            "Gluten-Free",
            "Only includes gluten-free meals",
            activeFilters[Filter.glutenFree]!,
            (bool newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, newValue);
            },
          ),
          customSwitch(
            context,
            "Vegan",
            "Only includes vegan meals",
            activeFilters[Filter.vegan]!,
            (bool newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newValue);
            },
          ),
          customSwitch(
            context,
            "Vegetarian",
            "Only includes vegetarian meals",
            activeFilters[Filter.vegeterian]!,
            (bool newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, newValue);
            },
          ),
          customSwitch(
            context,
            "Lactose",
            "Only includes Lactose meals",
            activeFilters[Filter.lactosFree]!,
            (bool newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosFree, newValue);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}
