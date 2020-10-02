import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:flutter_demo2/controllers/basket_controller.dart';
import 'package:get/get.dart';

class BasketView extends GetView<BasketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: GetBuilder<BasketController>(
        initState: (_) => BasketController.to.handleGetBasket(),
        builder: ($) => $.basket != null
            ? ListView.builder(
                itemCount: $.basket.items.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      // Container(
                      //   child: Image.network($.category.products[index].image),
                      //   height: 100,
                      //   width: 140,
                      // ),
                      Expanded(
                        child: Column(
                          children: [
                            Text($.basket.items[index].title),
                          ],
                        ),
                      ),
                    ],
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
