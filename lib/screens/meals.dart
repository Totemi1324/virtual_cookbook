import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class ScreenMeals extends StatefulWidget {
  static const routeName = "/meals";
  final List<Meal> filteredMeals;

  const ScreenMeals(this.filteredMeals, {super.key});

  @override
  State<ScreenMeals> createState() => _ScreenMealsState();
}

class _ScreenMealsState extends State<ScreenMeals> {
  String? categoryId;
  String? categoryTitle;
  List<Meal> mealsFromCategory = [];

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    categoryId = args?["id"];
    categoryTitle = args?["title"];
    mealsFromCategory = widget.filteredMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? "Error"),
      ),
      body: mealsFromCategory.isNotEmpty
          ? ListView.builder(
              itemBuilder: (buildContext, index) {
                return MealItem(
                  id: mealsFromCategory[index].id,
                  name: mealsFromCategory[index].name,
                  imageURL: mealsFromCategory[index].imageURL,
                  durationInMinutes: mealsFromCategory[index].durationInMinutes,
                  complexity: mealsFromCategory[index].complexity,
                  affordability: mealsFromCategory[index].affordability,
                );
              },
              itemCount: mealsFromCategory.length,
            )
          : Center(
              child: Text(
                categoryTitle == null
                    ? "Some error occured on the route: Data not found."
                    : "No menus in this category that satisfy your filter settings.",
              ),
            ),
    );
  }
}
