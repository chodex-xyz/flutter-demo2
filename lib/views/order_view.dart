import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Get.parameters['order']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ ${Get.parameters['order']}'),
      ),
    );
  }
}
