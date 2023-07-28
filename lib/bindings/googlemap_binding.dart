import 'package:get/get.dart';
import 'package:map_app/pages/googlemap_page/googlemap_controller.dart';

class GooglgeMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GoogleMapPageController>(
      GoogleMapPageController());
  }
}