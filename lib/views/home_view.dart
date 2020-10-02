import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/controllers/menu_controller.dart';
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
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.toNamed("/category/${$.categories[index].slug}");
                  },
                  child: Container(child: Image.network($.categories[index].image))),
            ),
          );
        },
      ),
    );
  }
}
