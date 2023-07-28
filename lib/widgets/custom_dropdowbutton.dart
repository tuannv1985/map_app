import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdowButton extends StatefulWidget {
  String? itemSelect;
  final List itemType;
  Function(String) updateValue;
  CustomDropdowButton({super.key, required this.itemSelect, required this.itemType, required this.updateValue});

  @override
  State<CustomDropdowButton> createState() => _CustomDropdowButtonState();
}

class _CustomDropdowButtonState extends State<CustomDropdowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent)),
      child: DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          iconSize: 30,
          value: widget.itemSelect,
          onChanged: (String? value) {
            setState(() {
              widget.itemSelect = value!;
            });
            widget.updateValue(value??"");
          },
          items: widget.itemType.map((newvalue) {
            return DropdownMenuItem<String>(
              value: newvalue,
              child: Text(
                newvalue??'',
                style: const TextStyle(fontSize: 15),
              ),
            );
          }).toList()),
    );
  }
}
