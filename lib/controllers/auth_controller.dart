import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLogged = false.obs;
  set isLogged(value) => _isLogged.value = value;
  get isLogged => _isLogged.value;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2500), () {
      Get.offAllNamed('/home');
    });
  }
}
