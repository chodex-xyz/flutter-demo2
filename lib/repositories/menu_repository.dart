import 'package:flutter_demo2/models/category_list_model.dart';
import 'package:flutter_demo2/services/http_client.dart';

abstract class MenuRepository {
  Future<List<CategoryListModel>> getCategoryList();
}

class MenuRepositoryImpl extends MenuRepository {
  final HttpClient _client;

  MenuRepositoryImpl(this._client);

  @override
  Future<List<CategoryListModel>> getCategoryList() async {
    final String categoriesEndpoint = '/categories/';

    final response = await _client.get(categoriesEndpoint);
    return (response as List).map<CategoryListModel>((json) => CategoryListModel.fromJson(json)).toList();
  }
}
