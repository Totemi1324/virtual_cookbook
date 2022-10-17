import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const CategoryItem(this.title, this.backgroundColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor.withOpacity(0.7),
            backgroundColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}
