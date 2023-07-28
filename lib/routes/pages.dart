
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:map_app/bindings/detail_order_binding.dart';
import 'package:map_app/bindings/googlemap_binding.dart';
import 'package:map_app/bindings/home_binding.dart';
import 'package:map_app/bindings/login_binding.dart';
import 'package:map_app/pages/googlemap_page/googlemap_page.dart';
import 'package:map_app/pages/detail_order/detail_order_page.dart';
import 'package:map_app/pages/home/home_page.dart';
import 'package:map_app/pages/login_page/Login_page.dart';
import 'package:map_app/routes/routes.dart';
class Pages {
  static List<GetPage> getPages = [
    GetPage(name: Routes.initialRoute, page: () => const LoginPage(), bindings: [
      LoginBinding(),
    ]),
    GetPage(name: Routes.homePage, page: () => const HomePage(), bindings: [
      HomeBinding()
    ]),
    GetPage(name: Routes.detailOrder, page: () => const DetailOrderPage(), bindings: [
      DetailOrderBinding()
    ]),
    GetPage(name: Routes.mapPage, page: () => const GoogleMapPage(), bindings: [
      GooglgeMapBinding()
    ]),
  ];
}