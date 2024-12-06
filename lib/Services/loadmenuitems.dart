import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/ItemModel.dart';
import '../models/categorymodel.dart';
import '../models/menu-item.dart';

//menu items
Future<MenuResponse> loadMenuItems() async {
  final String response = await rootBundle.loadString('assets/dataset.json');
  final Map<String, dynamic> data = json.decode(response);
  return MenuResponse.fromJson(data);
}

//categories
Future<CategoryResponse> loadCategories() async {
  final String response = await rootBundle.loadString('assets/dataset.json');
  final Map<String, dynamic> data = json.decode(response);
  return CategoryResponse.fromJson(data);
}

//items
Future<ItemResponse> loadItems() async {
  final String response = await rootBundle.loadString('assets/dataset.json');
  final Map<String, dynamic> data = json.decode(response);
  return ItemResponse.fromJson(data);
}
