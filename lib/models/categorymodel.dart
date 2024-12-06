class Category {
  final String id;
  final String menuCategoryId;
  final String menuId;
  final String storeId;
  final String title;
  final String subTitle;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  Category({
    required this.id,
    required this.menuCategoryId,
    required this.menuId,
    required this.storeId,
    required this.title,
    required this.subTitle,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['ID'],
      menuCategoryId: json['MenuCategoryID'],
      menuId: json['MenuID'],
      storeId: json['StoreID'],
      title: json['Title']['en'],
      subTitle: json['SubTitle']['en'],
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
    );
  }
}

class MenuEntity {
  final String id;
  final String type;

  MenuEntity({
    required this.id,
    required this.type,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) {
    return MenuEntity(
      id: json['ID'],
      type: json['Type'],
    );
  }
}

class CategoryResponse {
  final bool status;
  final List<Category> categories;

  CategoryResponse({
    required this.status,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['Status'],
      categories: (json['Result']['Categories'] as List<dynamic>)
          .map((item) => Category.fromJson(item))
          .toList(),
    );
  }
}
