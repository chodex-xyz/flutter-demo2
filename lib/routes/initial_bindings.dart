import 'package:dio/dio.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:flutter_demo2/controllers/menu_controller.dart';
import 'package:flutter_demo2/data/repositories/menu_repository.dart';
import 'package:flutter_demo2/services/http_client.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // инициализируем http client c куками
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);

    Get.put(AuthController(), permanent: true);

    Get.lazyPut<MenuRepository>(
      () => MenuRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.lazyPut<MenuController>(() => MenuController(Get.find<MenuRepository>()));
  }
}
