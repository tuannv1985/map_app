
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  DateTime now = DateTime.now();
  late String formattedDate = DateFormat('dd/MM/yyyy').format(now);
  int stt = 0;
  List listCargo = [
    ['DH001', 'Linh kiện điện tử', '5,000,000', '03/07/2023'],
    ['DH002', 'Hàng hóa tổng hợp', '4,500,000', '10/07/2023'],
    ['DH003', 'Linh kiện xe', '5,500,000', '12/07/2023'],
    ['DH004', 'Linh kiện xe', '3,500,000', '15/07/2023'],
    ['DH005', 'Linh kiện xe', '2,500,000', '20/07/2023'],
  ];

}
