// menu_item.dart
class MenuItem {
  final String id;
  final String menuId;
  final String verticalId;
  final String storeId;
  final String title;
  final String? subTitle;
  final String? description;
  final List<String> menuCategoryIds;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  MenuItem({
    required this.id,
    required this.menuId,
    required this.verticalId,
    required this.storeId,
    required this.title,
    this.subTitle,
    this.description,
    required this.menuCategoryIds,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['ID'],
      menuId: json['MenuID'],
      verticalId: json['VerticalID'],
      storeId: json['StoreID'],
      title: json['Title']['en'],
      subTitle: json['SubTitle'],
      description: json['Description'],
      menuCategoryIds: List<String>.from(json['MenuCategoryIDs']),
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
    );
  }
}

class MenuResponse {
  final bool status;
  final List<MenuItem> menu;

  MenuResponse({
    required this.status,
    required this.menu,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) {
    return MenuResponse(
      status: json['Status'],
      menu: (json['Result']['Menu'] as List<dynamic>)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
    );
  }
}
