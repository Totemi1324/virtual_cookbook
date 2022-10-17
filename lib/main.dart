import 'package:flutter/material.dart';

import './screens/categories.dart';
import './screens/meals.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    return MaterialApp(
      title: 'Virtual Cookbook',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.teal,
        ),
        canvasColor: const Color.fromARGB(255, 255, 237, 229),
        fontFamily: "Raleway",
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
        ),
      ),
      home: const ScreenCategories(),
      routes: {
        "/meals": (context) => const ScreenMeals()
      },
    );
  }
}
