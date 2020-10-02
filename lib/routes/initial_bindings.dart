import 'package:dio/dio.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:flutter_demo2/controllers/basket_controller.dart';
import 'package:flutter_demo2/controllers/category_controller.dart';
import 'package:flutter_demo2/controllers/menu_controller.dart';
import 'package:flutter_demo2/data/repositories/auth_repository.dart';
import 'package:flutter_demo2/data/repositories/basket_repository.dart';
import 'package:flutter_demo2/data/repositories/menu_repository.dart';
import 'package:flutter_demo2/services/http_client.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // инициализируем http client c куками
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.put(AuthController(Get.find<AuthRepository>()), permanent: true);

    Get.lazyPut<BasketRepository>(
      () => BasketRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.put(BasketController(Get.find<BasketRepository>()), permanent: true);

    Get.lazyPut<MenuRepository>(
      () => MenuRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.put(MenuController(Get.find<MenuRepository>()), permanent: true);

    Get.put(CategoryController(Get.find<MenuRepository>()), permanent: true);
  }
}
