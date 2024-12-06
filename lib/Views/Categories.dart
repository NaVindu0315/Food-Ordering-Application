import 'package:flutter/material.dart';

import '../Services/loadmenuitems.dart';
import '../models/categorymodel.dart';

import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<CategoryResponse>(
        future: loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.status) {
            return Center(child: Text('No categories available'));
          }

          final categories = snapshot.data!.categories;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                title: Text(category.title),
                subtitle: Text(category.menuCategoryId),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
