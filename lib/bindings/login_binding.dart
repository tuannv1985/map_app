import 'package:get/get.dart';
import 'package:map_app/pages/login_page/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController());
  }
}