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
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.offAllNamed('/basket');
                },
                child: Icon(Icons.shopping_basket),
                backgroundColor: Colors.green,
              ),
              body: ListView.builder(
                  itemCount: $.category.products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          child: Image.network($.category.products[index].image),
                          height: 100,
                          width: 140,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text($.category.products[index].name),
                              RaisedButton(
                                onPressed: () {
                                  Get.snackbar(
                                    ':)',
                                    'Товар добавлен в корзину',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                  );
                                },
                                child: Text('Хочу'),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
