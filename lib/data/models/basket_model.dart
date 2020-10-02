class BasketModel {
  List<BasketItemModel> items;

  BasketModel.fromJson(Map<String, dynamic> json) {
    this.items = (json['items'] as List).map<BasketItemModel>((e) => BasketItemModel.fromJson(e)).toList();
  }
}

class BasketItemModel {
  String title;

  BasketItemModel({this.title});

  BasketItemModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() => {'title': title};
}
