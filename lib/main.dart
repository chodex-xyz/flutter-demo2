import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:flutter_demo2/routes/initial_bindings.dart';
import 'package:flutter_demo2/views/basket_view.dart';
import 'package:flutter_demo2/views/category_view.dart';
import 'package:flutter_demo2/views/home_view.dart';
import 'package:flutter_demo2/views/order_view.dart';
import 'package:flutter_demo2/views/splash_view.dart';
import 'package:get/get.dart';

import 'controllers/menu_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(name: '/', page: () => SplashView()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/category/:category', page: () => CategoryView()),
        GetPage(name: '/basket', page: () => BasketView()),
        GetPage(name: '/order/:order', page: () => OrderView()),
      ],
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Farfor'),
      //   ),
      //   body: Text('hi'),
      // ),
    );
  }
}
