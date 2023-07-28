import 'package:get/get.dart';
import 'package:map_app/pages/detail_order/detail_order_controller.dart';

class DetailOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailOrderController>(
      DetailOrderController());
  }
}