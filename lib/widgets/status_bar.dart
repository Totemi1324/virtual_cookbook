import 'package:flutter/material.dart';

enum ColorMode { unified, gradual }

class StatusBar extends StatelessWidget {
  final int totalUnits;
  final double fillPercentage;
  final ColorMode colorMode;
  final Color? fillColor;

  const StatusBar(
      {required this.totalUnits,
      required this.fillPercentage,
      required this.colorMode,
      this.fillColor,
      super.key});

  List<Widget> _buildStatusBar(BuildContext buildContext) {
    Color dynamicFill;

    switch (colorMode) {
      case ColorMode.unified:
        dynamicFill = fillColor ?? Theme.of(buildContext).colorScheme.primary;
        break;
      case ColorMode.gradual:
        {
          if (fillPercentage <= 1 / 3) {
            dynamicFill = Colors.green.shade700;
          } else if (fillPercentage <= 2 / 3) {
            dynamicFill = Colors.yellow.shade700;
          } else {
            dynamicFill = Colors.red.shade800;
          }
        }
        break;
      default:
        dynamicFill = Theme.of(buildContext).colorScheme.primary;
        break;
    }

    return List.generate(
        totalUnits,
        (index) => Container(
              width: 15,
              height: 15,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index + 1 <= totalUnits * fillPercentage
                    ? dynamicFill
                    : Colors.transparent,
                border: Border.all(
                  color: dynamicFill,
                  width: 2,
                ),
              ),
            ),
        growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildStatusBar(context),
    );
  }
}
