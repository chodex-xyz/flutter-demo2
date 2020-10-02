import 'package:flutter_demo2/models/category_list_model.dart';
import 'package:flutter_demo2/repositories/menu_repository.dart';

import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find();

  MenuController(this._menuRepository);

  final MenuRepository _menuRepository;

  final categoriesLoaded = false.obs;
  List<CategoryListModel> categories = List<CategoryListModel>();

  @override
  void onInit() async {
    super.onInit();
    await fetchCategories();
  }

  fetchCategories() async {
    categories = await _menuRepository.getCategoryList();
    print(categories);
    categoriesLoaded.value = true;
  }
}
