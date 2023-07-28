import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/pages/home/home_controller.dart';
import 'package:map_app/widgets/custom_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          stackBackground(),
          Column(
            children: [
              stackHeader(),
              stackBody(context),
            ],
          )
        ],
      ),
    );
  }

  Widget stackBackground() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(color: const Color.fromARGB(255, 230, 252, 62)),
        ),
        Expanded(
          flex: 5,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }

  Widget stackHeader() {
    return const ListTile(
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
      title: Text(
        'Hi, Nguyễn Văn Hòa',
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Have a nice day',
        style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
      ),
      trailing: CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatar.png"),
      ),
    );
  }

  Widget stackBody(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Card(
              color: const Color.fromARGB(255, 250, 253, 224),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Đơn hàng hôm nay",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Text('Day: ${controller.formattedDate}'),
                  Expanded(
                      child: Center(
                          child: Text(
                       message.notification!.title!.isNotEmpty
                        ? message.notification!.title!
                        : 'Bạn chưa có đơn hàng mới nào',
                    style: const TextStyle(fontSize: 20),
                  ))),
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              color: const Color.fromARGB(255, 250, 253, 224),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Số chuyến hoàn thành trong Tháng",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [tableHeader(), tableContent()],
                    ),
                  ))
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget tableHeader() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(30),
        1: FixedColumnWidth(80),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(100),
      },
      border: const TableBorder(
        top: BorderSide(width: 1),
        bottom: BorderSide.none,
        left: BorderSide(width: 1),
        right: BorderSide(width: 1),
        horizontalInside: BorderSide(width: 1),
        verticalInside: BorderSide(width: 1),
      ),
      children: <TableRow>[
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 40,
              child: const Center(
                child: Text(
                  "STT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 40,
              child: const Center(
                child: Text(
                  "Đơn hàng",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 40,
              child: const Center(
                child: Text(
                  "Tiền lương",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 40,
              child: const Center(
                child: Text(
                  "Ngày giao",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: Container(
              color: Colors.amber,
              height: 40,
              child: const Center(
                child: Text(
                  "Ghi chú",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 12),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget tableContent() {
    controller.stt = 0;
    return SingleChildScrollView(
      child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(30),
            1: FixedColumnWidth(80),
            2: FixedColumnWidth(100),
            3: FixedColumnWidth(100),
            4: FixedColumnWidth(100),
          },
          border: const TableBorder(
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
            horizontalInside: BorderSide(width: 1),
            verticalInside: BorderSide(width: 1),
          ),
          children: controller.listCargo.map((e) {
            controller.stt++;
            return childTableRow(e);
          }).toList()),
    );
  }

  TableRow childTableRow(List listCargo) {
    return TableRow(children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          height: 30,
          child: Center(
            child: Text(
              '${controller.stt}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          height: 30,
          child: Center(
            child: Text(
              listCargo[0],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          height: 30,
          child: Center(
            child: Text(
              listCargo[2],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          height: 30,
          child: Center(
            child: Text(
              listCargo[3],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.bottom,
        child: Container(
          height: 30,
          child: const Center(
            child: Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
    ]);
  }
}
