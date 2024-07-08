import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  bool _lactoseFreeFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(
        onSelectScreen: (route) {
          Navigator.of(context).pop();
          if (route == 'meals') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const TabsScreen()),
            );
          }
        },
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            "Gluten-Free",
            "Only includes gluten-free meals",
            _glutenFreeFilter,
            (bool newValue) {
              setState(() {
                _glutenFreeFilter = newValue;
              });
            },
          ),
          customSwitch(
            context,
            "Vegan",
            "Only includes vegan meals",
            _veganFilter,
            (bool newValue) {
              setState(() {
                _veganFilter = newValue;
              });
            },
          ),
          customSwitch(
            context,
            "Vegetarian",
            "Only includes vegetarian meals",
            _vegetarianFilter,
            (bool newValue) {
              setState(() {
                _vegetarianFilter = newValue;
              });
            },
          ),
          customSwitch(
            context,
            "Lactose",
            "Only includes Lactose meals",
            _lactoseFreeFilter,
            (bool newValue) {
              setState(() {
                _lactoseFreeFilter = newValue;
              });
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
