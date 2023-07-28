import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  String? itemSelect = '';
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Container(
                      height: 150,
                      child: Column(
                        children: [
                          const Text(
                            'Báo cáo sự cố',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent)),
                            child: DropdownButton(
                                isExpanded: true,
                                underline: const SizedBox(),
                                iconSize: 30,
                                onChanged: (String? value) {
                                  setState(() {});
                                },
                                items: itemList.map((newvalue) {
                                  return DropdownMenuItem<String>(
                                    value: newvalue,
                                    child: Text(
                                      newvalue ?? '',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  );
                                }).toList()),
                          )
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: const BorderSide(
                          //             color: Colors.blueAccent, width: 1)),
                          //     focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: const BorderSide(
                          //             color: Colors.blue, width: 1.5)),
                          //   ),
                          //   style: const TextStyle(fontSize: 20),
                          // )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Gửi',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                );
              },
              child: const Text('ĐĂNG NHẬP',
                  style: TextStyle(fontSize: 20, color: Colors.white)))),
    );
  }
  List itemList = [
    'Xe thay vá lốp',
    'Xe chết máy',
    'Mưa to, đường sạt lở',
    'Tắc đường'
  ];
}
