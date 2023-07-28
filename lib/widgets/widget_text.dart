import 'package:flutter/material.dart';

Widget widgetText(String text, {double fontSize = 16, Color? color}){
  return Text(text, style: TextStyle(fontSize: fontSize, color: color),);
}