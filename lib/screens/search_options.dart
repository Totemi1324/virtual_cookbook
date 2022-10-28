import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class ScreenSearchOptions extends StatefulWidget {
  static const routeName = "/search_options";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const ScreenSearchOptions(this.saveFilters, this.currentFilters, {super.key});

  @override
  State<ScreenSearchOptions> createState() => _ScreenSearchOptionsState();
}

class _ScreenSearchOptionsState extends State<ScreenSearchOptions> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["glutenFree"]!;
    _lactoseFree = widget.currentFilters["lactoseFree"]!;
    _vegetarian = widget.currentFilters["vegetarian"]!;
    _vegan = widget.currentFilters["vegan"]!;
    super.initState();
  }

  Widget _buildFilterSelector(String title, String subtitle, bool currentValue,
          Function(bool) updateValue) =>
      SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberCook"),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              "glutenFree": _glutenFree,
              "lactoseFree": _lactoseFree,
              "vegetarian": _vegetarian,
              "vegan": _vegan,
            }),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your search filters:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFilterSelector(
                  "Gluten-free",
                  "Only include gluten-free meals.",
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildFilterSelector(
                  "Lactose-free",
                  "Only include lactose-free meals.",
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildFilterSelector(
                  "Vegetarian",
                  "Only include meals that don't contain meat.",
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildFilterSelector(
                  "Vegan",
                  "Only include meals that don't contain animal products.",
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
