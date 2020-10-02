import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:flutter_demo2/controllers/basket_controller.dart';
import 'package:flutter_demo2/data/models/basket_model.dart';
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
                  return _basketItem($.basket.items[index]);
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await BasketController.to.handlerOrder();
          Get.offAllNamed('/order/123');
        },
        child: Icon(Icons.shopping_basket),
        backgroundColor: Colors.green,
      ),
    );
  }

  _basketItem(BasketItemModel item) {
    return Row(
      children: [
        Container(
          child: Image.network(item.image),
          height: 100,
          width: 140,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title),
                Text("${item.price.toString()} рублей"),
                Text("${item.quantity.toString()} шт"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
