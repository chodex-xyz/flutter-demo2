class CategoryModel {
  String name;
  List<ProductModel> products;

  CategoryModel({this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.products = (json['products'] as List).map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {'name': name};
}

class ProductModel {
  int productId;
  String image;
  String name;

  ProductModel({this.image, this.name});

  ProductModel.fromJson(Map<String, dynamic> json) {
    this.image = json['image'];
    this.name = json['name'];
    this.productId = json['modifications'][0]['id'];
  }

  Map<String, dynamic> toJson() => {'image': image, 'name': name};
}
