import 'package:get/get.dart';
import 'package:map_app/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController());
  }
}