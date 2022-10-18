enum Complexity { simple, advanced, hard }

enum Affordability { affordable, costly, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String name;
  final String imageURL;
  final List<Map<String, Object>> ingredients;
  final List<String> prepSteps;
  final int durationInMinutes;
  final Complexity complexity;
  final Affordability affordability;

  final bool isGlutenfree;
  final bool isLactosefree;
  final bool isVegetarian;
  final bool isVegan;

  Meal(
      {required this.id,
      required this.categories,
      required this.name,
      required this.imageURL,
      required this.ingredients,
      required this.prepSteps,
      required this.durationInMinutes,
      required this.complexity,
      required this.affordability,
      this.isGlutenfree = false,
      this.isLactosefree = false,
      this.isVegetarian = false,
      this.isVegan = false});
}
