import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/pages/detail_order/detail_order_controller.dart';
import 'package:map_app/widgets/custom_drawer.dart';
import 'package:map_app/widgets/widget_elevated_button.dart';
import 'package:map_app/widgets/widget_text.dart';

class DetailOrderPage extends GetView<DetailOrderController> {
  const DetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết đơn hàng"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            header(width),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  bodyHeader(),
                  bodyContent(),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }

  Widget header(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     widgetText('Đơn hàng'),
        //     customContainer(
        //         CustomDropdowButton(
        //             itemSelect: controller.itemOrder.value,
        //             itemType: controller.listItemOrder,
        //             updateValue: (e) => {controller.itemOrder.value = e}),
        //         width * 1 / 3),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     widgetText('Số xe'),
        //     Obx(
        //       () => customContainer(
        //           Text(
        //             controller.itemTruct(controller.itemOrder.value).value,
        //             style: const TextStyle(fontSize: 15),
        //             textAlign: TextAlign.center,
        //           ),
        //           width * 1 / 3.5),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widgetElevatedButton(() {
              controller.confirmOrder();
            }, widgetText('Xác nhận giao hàng')),
            widgetElevatedButton(() {
              controller.confirmEndOrder();
            }, widgetText('Kết thúc giao hàng')),
          ],
        )
      ],
    );
  }

  Widget bodyHeader() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(30),
        1: FixedColumnWidth(40),
        2: FixedColumnWidth(120),
        3: FixedColumnWidth(50),
        4: FixedColumnWidth(350),
        5: FixedColumnWidth(100),
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
                  "Chọn",
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
                  "Hàng hóa",
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
                  "Số lượng",
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
                  "Địa điểm giao",
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

  Widget bodyContent() {
    controller.stt = 0;
    return Obx(
      () => SingleChildScrollView(
        child: Table(
            columnWidths: const <int, TableColumnWidth>{
               0: FixedColumnWidth(30),
        1: FixedColumnWidth(40),
        2: FixedColumnWidth(120),
        3: FixedColumnWidth(50),
        4: FixedColumnWidth(350),
        5: FixedColumnWidth(100),
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
      ),
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
          child: Container(
            height: 30,
            child: Center(
              child: Checkbox(
                value: true,
                activeColor: Colors.blue,
                onChanged: (bool? value) {
                  value != value;
                },
              ),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          padding: const EdgeInsets.only(left: 3),
          alignment: Alignment.centerLeft,
          height: 30,
          child: Text(
            listCargo[1],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
          padding: const EdgeInsets.only(left: 3),
          alignment: Alignment.centerLeft,
          height: 30,
          child: Text(
            listCargo[3],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.bottom,
        child: Container(
          height: 30,
          child: Center(
            child: Text(
              "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
    ]);
  }
}
