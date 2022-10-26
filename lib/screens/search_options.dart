import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class ScreenSearchOptions extends StatelessWidget {
  static const routeName = "/search_options";

  const ScreenSearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberCook"),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text("Filters!"),
      ),
    );
  }
}
