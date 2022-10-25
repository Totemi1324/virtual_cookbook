import 'package:flutter/material.dart';

import './favourites.dart';
import './categories.dart';

class ScreenTabs extends StatefulWidget {
  const ScreenTabs({super.key});

  @override
  State<ScreenTabs> createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
  final List<Widget> _pages = [
    const ScreenCategories(),
    const ScreenFavourites(),
  ];
  var _selectedPageIndex = 0;

  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberCook"),
      ),
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
