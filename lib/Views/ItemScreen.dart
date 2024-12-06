import 'package:flutter/material.dart';
import '../Services/loadmenuitems.dart';
import '../models/ItemModel.dart';
import '../models/menu-item.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late Future<ItemResponse> futureitems;

  @override
  void initState() {
    super.initState();
    futureitems = loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: FutureBuilder<ItemResponse>(
        future: futureitems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.itm.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final menuItems = snapshot.data!.itm;

          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return ListTile(
                leading: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    item.imageurl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Image not found'));
                    },
                  ),
                ),
                title: Text(item.id),
                subtitle: Text(item.menuId.toString() ?? 'No subtitle'),
                onTap: () {
                  // Access specific fields
                  print('Menu ID: ${item.menuId}');
                  print('Store ID: ${item.imageurl}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
