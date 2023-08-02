import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:map_app/hives/hive_login.dart';
import 'package:map_app/widgets/custom_dialog.dart';

class LoginController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  double height = Get.height;
  double width = Get.width;
  RxBool checkbox = true.obs;
  final _boxLogin = Hive.box<HiveLogin>('login');
  final login = HiveLogin();
  @override
  void onInit() async {
    super.onInit();
    final boxLogin = _boxLogin.get('login');
    if (boxLogin != null) {
      controllerName.text = boxLogin.user!;
      controllerPass.text = boxLogin.pass!;
    }
  }

  Future<void> logIn() async {
    try {
      var user = controllerName.text;
      var pass = controllerPass.text;
      if (user.isEmpty || pass.isEmpty) {
        if (user.isEmpty) {
          customDialog('Vui lòng nhập tên đăng nhập', Get.context!);
        }
        if (pass.isEmpty) {
          customDialog('Vui lòng nhập mật khẩu', Get.context!);
        }
      } else {
        var response = await Dio().get(
            'http://113.161.6.185:82/api/User/Get?user=$user&password=$pass');
        if (response.statusCode == 200) {
          if (checkbox.value) {
            login.user = user;
            login.pass = pass;
            _boxLogin.put('login', login);
          } else {
            _boxLogin.delete('login');
          }

          Get.toNamed('/detailOrder');
        } else {
          print('Fetch fail');
        }
      }
    } catch (e) {
      customDialog('Đăng nhập lỗi', Get.context!);
    }
  }
}
