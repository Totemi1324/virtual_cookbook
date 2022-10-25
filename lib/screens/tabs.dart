import 'package:flutter/material.dart';

import './favourites.dart';
import './categories.dart';

class ScreenTabs extends StatefulWidget {
  const ScreenTabs({super.key});

  @override
  State<ScreenTabs> createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CyberCook"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favourites",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ScreenCategories(),
            ScreenFavourites(),
          ],
        ),
      ),
    );
  }
}
