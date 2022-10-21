import 'package:flutter/material.dart';

import '../data/meals_data.dart';

class ScreenMealDetails extends StatelessWidget {
  static const routeName = "/meals/meal_details";

  const ScreenMealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    final selectedMeal = meals.firstWhere((meal) => args == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal name"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 270,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageURL,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
