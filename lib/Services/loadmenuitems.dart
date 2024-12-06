import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/menu-item.dart';

Future<MenuResponse> loadMenuItems() async {
  final String response = await rootBundle.loadString('assets/dataset.json');
  final Map<String, dynamic> data = json.decode(response);
  return MenuResponse.fromJson(data);
}
