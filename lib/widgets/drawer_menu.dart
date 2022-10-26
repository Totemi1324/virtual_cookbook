import 'package:flutter/material.dart';

import '../screens/search_options.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  Widget _buildOption(BuildContext buildContext, IconData icon, String name,
      VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(buildContext).colorScheme.secondary,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 24,
          //fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              "CyberCook",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildOption(
            context,
            Icons.restaurant_menu,
            "Meals",
            () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          _buildOption(
            context,
            Icons.settings,
            "Search options",
            () => Navigator.of(context)
                .pushReplacementNamed(ScreenSearchOptions.routeName),
          ),
        ],
      ),
    );
  }
}
