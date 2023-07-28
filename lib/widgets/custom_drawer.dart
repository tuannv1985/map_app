import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/panel.png"),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Hi, Nguyễn Văn Hòa',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Have a nice day',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.7),
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text(
                'Chi tiết đơn hàng',
                style: TextStyle(fontSize: 16),
              ),
              onTap: (){
                Get.toNamed('/detailOrder');
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.monetization_on_sharp,
                color: Colors.blue,
              ),
              title: Text(
                'Chi phí lương',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.train,
                color: Colors.blue,
              ),
              title: Text(
                'Quản lý nhiên liệu',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.map_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Bản đồ',
                style: TextStyle(fontSize: 16),
              ),
              onTap: (){
                Get.toNamed('/mapPage');
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue,
              ),
              title: Text(
                'Thoát',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ));
  }
}
