import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Get.parameters['category']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Категория'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('kek'),
            subtitle: RaisedButton(
              onPressed: () {
                Get.offAllNamed('/basket');
              },
              child: Text('В корзину'),
            ),
          )
        ],
      ),
    );
  }
}
