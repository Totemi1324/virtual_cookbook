import 'package:flutter/material.dart';

class ScreenMeals extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;

  const ScreenMeals(this.categoryID, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: const Text("The recipes for the category"),
      ),
    );
  }
}
