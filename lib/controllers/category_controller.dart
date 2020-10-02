import 'package:flutter_demo2/data/models/category_model.dart';
import 'package:flutter_demo2/data/repositories/menu_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  final MenuRepository _menuRepository;

  CategoryController(this._menuRepository);

  CategoryModel category;

  void fetchCategory(String slug) async {
    category = await _menuRepository.getCategory(slug);
    update();
  }
}
