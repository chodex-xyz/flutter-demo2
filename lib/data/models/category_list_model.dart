class CategoryListModel {
  String slug;
  String name;
  String image;

  CategoryListModel({this.slug, this.name, this.image});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    this.slug = json['slug'];
    this.name = json['name'];
    this.image = json['image'];
  }

  Map<String, dynamic> toJson() => {'slug': slug, 'name': name, 'image': image};
}
