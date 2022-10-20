import 'package:flutter/material.dart';
class IconStatistic extends StatelessWidget {
  final IconData icon;
  final Widget content;

  const IconStatistic(this.icon, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        content,
      ],
    );
  }
}
