import 'package:flutter/material.dart';
import 'package:flutter_demo2/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    final slug = Get.parameters['category'];
    return GetBuilder<CategoryController>(
      initState: (_) => controller.fetchCategory(slug),
      builder: ($) => $.category != null
          ? Scaffold(
              appBar: AppBar(
                title: Text($.category.name),
              ),
              body: ListView.builder(
                  itemCount: $.category.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text($.category.products[index].name));
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
