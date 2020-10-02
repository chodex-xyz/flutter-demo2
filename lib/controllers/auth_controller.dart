import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLogged = false.obs;
  set isLogged(value) => _isLogged.value = value;
  get isLogged => _isLogged.value;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed('/home');
    });
  }
}
