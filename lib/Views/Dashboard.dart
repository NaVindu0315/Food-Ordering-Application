import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'Categories.dart';
import 'MenuItems.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MenuScreen(),
              ));
            },
            child: const Text('Menu'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              /*
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ItemsScreen(),
              ));*/
            },
            child: const Text('Items'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryList(),
              ));
            },
            child: const Text('Categories'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              /*
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ModifiersScreen(),
              ));*/
            },
            child: const Text('Modifiers'),
          ),
        ],
      ),
    );
  }
}
