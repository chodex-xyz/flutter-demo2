import 'package:flutter_demo2/core/urls.dart';
import 'package:flutter_demo2/data/models/category_list_model.dart';
import 'package:flutter_demo2/data/models/category_model.dart';
import 'package:flutter_demo2/services/http_client.dart';

abstract class MenuRepository {
  Future<List<CategoryListModel>> getCategoryList();
  Future<CategoryModel> getCategory(String slug);
}

class MenuRepositoryImpl extends MenuRepository {
  final HttpClient _client;

  MenuRepositoryImpl(this._client);

  @override
  Future<List<CategoryListModel>> getCategoryList() async {
    final response = await _client.get(URLs.categories);
    return (response as List).map<CategoryListModel>((json) => CategoryListModel.fromJson(json)).toList();
  }

  @override
  Future<CategoryModel> getCategory(String slug) async {
    final response = await _client.get("${URLs.categories}$slug/");

    return CategoryModel.fromJson(response);
  }
}
