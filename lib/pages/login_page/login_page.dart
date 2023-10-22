
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/pages/login_page/login_controller.dart';
import 'package:map_app/widgets/custom_textfield.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Đăng nhập'),
        //   centerTitle: true,
        // ),
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/portlogistic.png'),
            fit: BoxFit.cover,
            opacity: 0.9),      
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 1 / 3 * controller.height,
              width: controller.width,
              child: Image.asset('assets/images/checked.png'),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CustomTextfield(
                    controller: controller.controllerName,
                    text: 'Tên đăng nhập',
                    color: Colors.white,
                    icon: const Icon(Icons.person, color: Colors.white, size: 30,),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    controller: controller.controllerPass,
                    text: 'Mật khẩu',
                    obscureText: true,
                    color: Colors.white,
                    icon: const Icon(Icons.key, color: Colors.white, size: 30,),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                            value: controller.checkbox.value,
                            activeColor: Colors.blue,
                            onChanged: (bool? value) {
                              controller.checkbox.value = value!;
                            }),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Ghi nhớ đăng nhập",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    controller.logIn();
                  },
                  child: const Text('ĐĂNG NHẬP',
                      style: TextStyle(fontSize: 20, color: Colors.white))),
            )
          ],
        ),
      ),
    ));
  }
}
