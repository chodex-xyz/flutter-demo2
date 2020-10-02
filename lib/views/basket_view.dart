import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Авторизоваться'),
            onPressed: () {
              Get.bottomSheet(Container(
                height: double.infinity,
                child: Wrap(
                  children: <Widget>[
                    TextField(),
                    TextField(),
                    RaisedButton(
                      onPressed: () {
                        Get.offAllNamed("/order/2342");
                      },
                      child: Text('Войти'),
                    )
                  ],
                ),
              ));
            },
          )
        ],
      ),
    );
  }
}
