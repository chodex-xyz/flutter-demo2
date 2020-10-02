import 'package:flutter/material.dart';
import 'package:flutter_demo2/data/models/basket_model.dart';
import 'package:flutter_demo2/data/repositories/auth_repository.dart';
import 'package:flutter_demo2/data/repositories/basket_repository.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  static BasketController get to => Get.find();
  BasketModel basket;

  BasketRepository _basketRepository;
  BasketController(this._basketRepository);

  handleBasketAdd() async {
    await _basketRepository.addProduct();
  }

  handleGetBasket() async {
    basket = await _basketRepository.get();
    print("BASKET");
    print(basket);
    update();
  }
}
