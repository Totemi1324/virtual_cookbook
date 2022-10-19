import 'package:flutter/material.dart';

import './screens/categories.dart';
import './screens/meals.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Cookbook',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.teal,
        ),
        canvasColor: const Color.fromARGB(255, 255, 237, 229),
        fontFamily: "Raleway",
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.7),
                offset: const Offset(3, 3),
                blurRadius: 10,
              ),
            ],
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
      initialRoute: "/",
      routes: {
        "/": (_) => const ScreenCategories(),
        ScreenMeals.routeName: (_) => const ScreenMeals(),
      },
    );
  }
}
