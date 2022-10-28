import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';
import '../models/meal.dart';
import './favourites.dart';
import './categories.dart';

class ScreenTabs extends StatefulWidget {
  final List<Meal> favourites;

  const ScreenTabs(this.favourites, {super.key});

  @override
  State<ScreenTabs> createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
  var _pages = List<Widget>.empty();
  var _selectedPageIndex = 0;

  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      const ScreenCategories(),
      ScreenFavourites(widget.favourites),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberCook"),
      ),
      drawer: const DrawerMenu(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectPage,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
