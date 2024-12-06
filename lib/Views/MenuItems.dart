import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../Services/loadmenuitems.dart';
import '../models/menu-item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<MenuResponse> futureMenuItems;

  @override
  void initState() {
    super.initState();
    futureMenuItems = loadMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Items')),
      body: FutureBuilder<MenuResponse>(
        future: futureMenuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.menu.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final menuItems = snapshot.data!.menu;

          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.createdDate.toString() ?? 'No subtitle'),
                onTap: () {
                  print('Menu ID: ${item.menuId}');
                  print('Store ID: ${item.storeId}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
