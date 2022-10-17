import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenMeals extends StatelessWidget {
  const ScreenMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args["title"] ?? "Error"),
      ),
      body: Center(
        child: const Text("The recipes for the category"),
      ),
    );
  }
}
