import 'package:flutter/material.dart';

import '../data/meals_data.dart';

class ScreenMealDetails extends StatelessWidget {
  static const routeName = "/meals/meal_details";

  const ScreenMealDetails({super.key});

  Widget _buildSectionTitle(BuildContext buildContext, String titleText) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          titleText,
          style: Theme.of(buildContext).textTheme.titleMedium,
        ),
      );

  Widget _buildSection(BuildContext buildContext, Widget content) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: content,
      );

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    final selectedMeal = meals.firstWhere((meal) => args == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.network(
                selectedMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildSection(
              context,
              Column(
                children: selectedMeal.ingredients
                    .map(
                      (ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      "${ingredient["amount"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      "${ingredient["unit"] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              flex: 6,
                              child: Text("${ingredient["name"] ?? ""}"),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            _buildSectionTitle(context, "Preparation steps"),
            _buildSection(
              context,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      Flexible(
                        child: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 12,
                        child: Text(selectedMeal.prepSteps[index]),
                      )
                    ],
                  ),
                ),
                itemCount: selectedMeal.prepSteps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
