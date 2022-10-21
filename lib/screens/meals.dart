import 'package:flutter/material.dart';

import '../data/meals_data.dart';
import '../widgets/meal_item.dart';

class ScreenMeals extends StatelessWidget {
  static const routeName = "/meals";

  const ScreenMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final categoryId = args?["id"];
    final categoryTitle = args?["title"];
    final mealsFromCategory =
        meals.where((meal) => meal.categories.contains(categoryId)).toList();

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
          : const Text("Some error occured on the route: Data not found"),
    );
  }
}
