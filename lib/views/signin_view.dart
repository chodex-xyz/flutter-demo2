import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SigninView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: controller.phoneController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                controller: controller.passwordController,
              ),
              RaisedButton(
                onPressed: () {
                  controller.handleSignIn();
                },
                child: Text('Войти'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
