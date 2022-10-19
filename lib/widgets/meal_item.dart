import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String name;
  final String imageURL;
  final int durationInMinutes;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {required this.name,
      required this.imageURL,
      required this.durationInMinutes,
      required this.complexity,
      required this.affordability,
      super.key});

  void _onSelectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSelectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$durationInMinutes min.")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
