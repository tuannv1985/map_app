import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final bool obscureText;
  final Color? color;
  final Icon? icon;
  const CustomTextfield({super.key, required this.controller, required this.text,
   this.obscureText = false, this.color, this.icon});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
          prefixIcon: widget.icon,
          label: Text(
            widget.text,
            style: TextStyle(fontSize: 20, color: widget.color),
          ),
        ),
        style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }
}
