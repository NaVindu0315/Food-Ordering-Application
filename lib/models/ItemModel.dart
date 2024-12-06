class Itemmodel {
  final String id;
  final String menuId;
  final String imageurl;

  Itemmodel({
    required this.id,
    required this.menuId,
    required this.imageurl,
  });

  factory Itemmodel.fromJson(Map<String, dynamic> json) {
    return Itemmodel(
      id: json['ID'],
      menuId: json['MenuItemID'],
      imageurl: json['ImageURL'],
    );
  }
}

class ItemResponse {
  final bool status;
  final List<Itemmodel> itm;

  ItemResponse({
    required this.status,
    required this.itm,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) {
    return ItemResponse(
      status: json['Status'],
      itm: (json['Result']['Items'] as List<dynamic>)
          .map((item) => Itemmodel.fromJson(item))
          .toList(),
    );
  }
}
