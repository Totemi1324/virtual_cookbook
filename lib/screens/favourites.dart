import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class ScreenFavourites extends StatelessWidget {
  final List<Meal> favourites;

  const ScreenFavourites(this.favourites, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return const Center(
        child: Text("No favourites yet to show - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (buildContext, index) {
          return MealItem(
            id: favourites[index].id,
            name: favourites[index].name,
            imageURL: favourites[index].imageURL,
            durationInMinutes: favourites[index].durationInMinutes,
            complexity: favourites[index].complexity,
            affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );
    }
  }
}
