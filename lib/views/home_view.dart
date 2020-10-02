import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/controllers/menu_controller.dart';
import 'package:flutter_demo2/data/models/category_list_model.dart';
import 'package:get/get.dart';

class HomeView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farfor'),
      ),
      body: Obx(
        () {
          if (!controller.categoriesLoaded.value) {
            return Text('loading');
          }

          return GetBuilder<MenuController>(
            builder: ($) => GridView.builder(
              itemCount: $.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => _category($.categories[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _category(CategoryListModel category) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/category/${category.slug}");
      },
      child: Stack(
        children: [
          Image.network(category.image),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              category.name,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
