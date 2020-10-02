import 'package:flutter/material.dart';
import 'package:flutter_demo2/views/home_view.dart';
import 'package:flutter_demo2/views/splash_view.dart';
import 'package:get/get.dart';

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
      getPages: [
        GetPage(name: '/', page: () => SplashView()),
        GetPage(name: '/home', page: () => HomeView()),
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
