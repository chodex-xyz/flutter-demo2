import 'package:flutter_demo2/core/urls.dart';
import 'package:flutter_demo2/data/models/basket_model.dart';
import 'package:flutter_demo2/services/http_client.dart';

abstract class BasketRepository {
  Future<BasketModel> get();
  Future<bool> addProduct([int productId]);
}

class BasketRepositoryImpl extends BasketRepository {
  final HttpClient _client;

  BasketRepositoryImpl(this._client);

  @override
  Future<BasketModel> get() async {
    final response = await _client.get(URLs.basket);
    print(response);
    return BasketModel.fromJson(response);
  }

  @override
  Future<bool> addProduct([int productId = 10638]) async {
    final response = await _client.post(URLs.basketAdd, body: {"product_id": productId, "quantity": 1});

    print(get());
    return true;
  }
}
