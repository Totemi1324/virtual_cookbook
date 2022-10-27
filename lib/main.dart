import 'package:flutter/material.dart';

import './screens/tabs.dart';
import './screens/meals.dart';
import './screens/search_options.dart';
import './screens/meal_details.dart';
import './data/meals_data.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    "glutenFree": false,
    "lactoseFree": false,
    "vegetarian": false,
    "vegan": false,
  };
  var _filteredMeals = meals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _filteredMeals = meals.where((meal) {
        if (_filters["glutenFree"] == true && !meal.isGlutenfree) {
          return false;
        }
        if (_filters["lactoseFree"] == true && !meal.isLactosefree) {
          return false;
        }
        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        return true;
      },).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Cookbook',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amber.shade700,
        ),
        canvasColor: const Color.fromARGB(255, 255, 237, 229),
        fontFamily: "Raleway",
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          titleSmall: const TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.w300,
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
        "/": (_) => const ScreenTabs(),
        ScreenMeals.routeName: (_) => ScreenMeals(_filteredMeals),
        ScreenSearchOptions.routeName: (_) => ScreenSearchOptions(_setFilters),
        ScreenMealDetails.routeName: (_) => const ScreenMealDetails(),
      },
      // onGenerateRoute
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("Oops!"),
            ),
            body: const Center(
              child: Text(
                  "When trying to load your requested page, we ran into an unknown error. Please contact our support!"),
            ),
          ),
        );
      },
    );
  }
}
