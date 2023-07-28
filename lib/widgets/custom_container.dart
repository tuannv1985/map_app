import 'package:flutter/material.dart';

Widget customContainer(Widget child, double width) {
  return Container(
    alignment: Alignment.center,
    height: 35,
    width: width,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: child,
  );
}
