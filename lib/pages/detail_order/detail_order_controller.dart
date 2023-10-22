import 'package:get/get.dart';
import 'package:map_app/pages/googlemap_page/googlemap_controller.dart';

class DetailOrderController extends GetxController {
  final controllerGoogle =
      Get.put<GoogleMapPageController>(GoogleMapPageController());
  RxString itemOrder = 'DH001'.obs;
  RxString truct = ''.obs;
  RxList listCargo = [
    ['DH001', 'Linh kiện điện tử', '2', 'Công ty A, 54 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng'],
    ['DH001', 'Hàng hóa tổng hợp', '3', 'Công ty B, 100 Võ Nguyên Giáp, Sơn Trà, Đà Nẵng'],
    ['DH001', 'Linh kiện xe', '2', 'Công ty C, 30 Hàm Nghi, Hải Châu, Đà Nẵng'],    
  ].obs;
  int stt = 0;
  List<String> listItemOrder = [
    '',
    'DH001',
    'DH002',
    'DH003',
    'DH004',
    'DH005'
  ];
  @override
  void onInit() {
    super.onInit();
    listCargo;
  }

  void confirmOrder() {
    Get.toNamed('/mapPage');
    // controllerGoogle.timerAutoRun();
    // controllerGoogle.drawMarker();
    // controllerGoogle.upDateMyLocation();
    controllerGoogle.getUpdateDatabase();
    // controllerGoogle.getUpdateXml();
  }

  void confirmEndOrder() {
    // Get.toNamed('/mapPage');
    // controllerGoogle.timerRun.cancel();
    controllerGoogle.positionDatabase.cancel();
    controllerGoogle.boxLocation.clear();
  }

  RxString itemTruct(String itemOrder) {
    if (itemOrder == 'DH001') {
      truct = '92H-12345'.obs;
    }
    if (itemOrder == 'DH002') {
      truct = '43F-56789'.obs;
    }
    if (itemOrder == 'DH003') {
      truct = '43D-13579'.obs;
    }
    if (itemOrder == 'DH004') {
      truct = '75H-12345'.obs;
    }
    if (itemOrder == 'DH005') {
      truct = '74F-56789'.obs;
    }
    return truct;
  }
  // RxList listItemCargo(String itemOrder) {
  //   if (itemOrder == 'DH001') {
  //     listCargo = [
  //     ['DH001', 'L001', 'Mazda CX5'],
  //     ['DH001', 'L001', 'Mazda CX3'],
  //     ['DH001', 'L002', 'Kia Seltos'],
  //     ['DH001', 'L002', 'Mercedes'],
  //     ['DH001', 'L003', 'Tucsion'],
  //   ].obs;
  //   }
  //   if (itemOrder == 'DH002') {
  //     listCargo = [
  //     ['DH002', 'L004', 'Mazda CX5'],
  //     ['DH002', 'L004', 'Mazda CX3'],
  //     ['DH002', 'L005', 'Kia Seltos'],
  //     ['DH002', 'L005', 'Mercedes'],
  //     ['DH002', 'L005', 'Tucsion'],
  //   ].obs;
  //   }
  //   if (itemOrder == 'DH003') {
  //     listCargo = [
  //     ['DH003', 'L006', 'Mazda CX5'],
  //     ['DH003', 'L006', 'Mazda CX3'],
  //     ['DH003', 'L006', 'Kia Seltos'],
  //     ['DH003', 'L007', 'Mercedes'],
  //     ['DH003', 'L007', 'Tucsion'],
  //   ].obs;
  //   }
  //   if (itemOrder == 'DH004') {
  //     listCargo = [
  //     ['DH004', 'L008', 'Mazda CX5'],
  //     ['DH004', 'L008', 'Mazda CX3'],
  //     ['DH004', 'L009', 'Kia Seltos'],
  //     ['DH004', 'L009', 'Mercedes'],
  //     ['DH004', 'L009', 'Tucsion'],
  //   ].obs;
  //   }
  //   if (itemOrder == 'DH005') {
  //     listCargo = [
  //     ['DH005', 'L010', 'Mazda CX5'],
  //     ['DH005', 'L010', 'Mazda CX3'],
  //     ['DH005', 'L011', 'Kia Seltos'],
  //     ['DH005', 'L011', 'Mercedes'],
  //     ['DH005', 'L012', 'Tucsion'],
  //   ].obs;
  //   }
  //   return listCargo;
  // }
}
