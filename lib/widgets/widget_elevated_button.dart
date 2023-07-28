import 'package:flutter/material.dart';

Widget widgetElevatedButton(Function()? onPressed, Widget child) {
  return SizedBox(
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: child
    ),
  );
}
