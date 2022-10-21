import 'package:flutter/material.dart';

class ScreenMealDetails extends StatelessWidget {
  static const routeName = "/meals/meal_details";

  const ScreenMealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal name"),
      ),
      body: Center(
        child: Text("The meal with ID $args"),
      ),
    );
  }
}