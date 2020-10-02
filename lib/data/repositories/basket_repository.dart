import 'package:flutter_demo2/core/urls.dart';
import 'package:flutter_demo2/data/models/basket_model.dart';
import 'package:flutter_demo2/services/http_client.dart';

abstract class BasketRepository {
  Future<BasketModel> get();
  Future<bool> addProduct([int productId]);
  Future checkout();
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

  @override
  Future checkout() async {
    final response = await _client.post(URLs.basketCheckout, body: {
      "number_of_persons": 1,
      "phone": "79373610161",
      "username": "Афоня",
      "bonus": 0,
      "cash_amount": 1500,
      "notification_type": "call",
      "gifts": [],
      "additives": [
        {"product_id": 5020, "free_quantity": 0, "paid_quantity": 0},
        {"product_id": 3132, "free_quantity": 0, "paid_quantity": 0},
        {"product_id": 5029, "free_quantity": 0, "paid_quantity": 0},
        {"product_id": 5050, "free_quantity": 1, "paid_quantity": 0},
        {"product_id": 5038, "free_quantity": 0, "paid_quantity": 0}
      ],
      "payment_type": "cash",
      "payment_method": "",
      "delivery": {"type": "courier", "pickup_point_id": 2, "address_id": 2471365, "delivery_date_time": "closest"},
      "notes": "",
      "source": "mobile_version",
    });
    print(response);
  }
}
