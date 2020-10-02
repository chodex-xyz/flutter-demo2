import 'package:flutter/material.dart';
import 'package:flutter_demo2/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  AuthRepository _authRepository;

  AuthController(this._authRepository);

  final _isLogged = false.obs;
  set isLogged(value) => _isLogged.value = value;
  get isLogged => _isLogged.value;

  TextEditingController phoneController; // to handle sign in /up
  TextEditingController passwordController; // to handle sign in /up

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed('/home');
    });
  }

  init() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  handleSignIn() async {
    try {
      await _authRepository.signIn(phoneController.text.trim(), passwordController.text.trim());
      Get.offAllNamed('/basket');
    } catch (e) {
      print(e);
      Get.snackbar('Ошибка', e.toString());
    }

    // await _authRepository.me();
  }
}
