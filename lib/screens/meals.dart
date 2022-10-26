import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../data/meals_data.dart';
import '../widgets/meal_item.dart';

class ScreenMeals extends StatefulWidget {
  static const routeName = "/meals";

  const ScreenMeals({super.key});

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
    mealsFromCategory =
        meals.where((meal) => meal.categories.contains(categoryId)).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      mealsFromCategory.removeWhere((meal) => meal.id == id);
    });
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
                  remove: _removeItem,
                );
              },
              itemCount: mealsFromCategory.length,
            )
          : const Text("Some error occured on the route: Data not found"),
    );
  }
}
