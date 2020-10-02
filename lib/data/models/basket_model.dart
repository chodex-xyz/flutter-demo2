class BasketModel {
  List<BasketItemModel> items;

  BasketModel.fromJson(Map<String, dynamic> json) {
    this.items = (json['items'] as List).map<BasketItemModel>((e) => BasketItemModel.fromJson(e)).toList();
  }
}

class BasketItemModel {
  String title;
  double price;
  String image;
  int quantity;

  BasketItemModel({this.title});

  BasketItemModel.fromJson(Map<String, dynamic> json) {
    print('JEJ');
    print(json);
    this.title = json['title'];
    this.price = json['price'];
    this.image = json['absolute_image_url'];
    this.quantity = json['product_info']['quantity'];
  }

  Map<String, dynamic> toJson() => {'title': title};
}
