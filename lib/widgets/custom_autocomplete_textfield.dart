// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class CustomAutoCompleteTextField extends StatefulWidget {
  TextEditingController controller;
  List<String?> listAuto = [];
  String text;
  void Function()? onPressed;
  CustomAutoCompleteTextField(
      {super.key, required this.controller, required this.listAuto, required this.text, required onPressed});

  @override
  State<CustomAutoCompleteTextField> createState() =>
      _CustomAutoCompleteTextFieldState();
}

class _CustomAutoCompleteTextFieldState
    extends State<CustomAutoCompleteTextField> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.8),
        border: Border.all(color: Colors.blue)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AutoCompleteTextField(
              clearOnSubmit: false,
              suggestionsAmount: 100,
              key: key,
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              style: const TextStyle(fontSize: 18),
              suggestions: widget.listAuto,
              itemSorter: (String? a, String? b) {
                return a!.compareTo(b!);
              },
              itemSubmitted: (String? data) {
                widget.text = data!;
              },
              itemFilter: (String? suggestion, String query) {
                return suggestion!.toLowerCase().contains(query.toLowerCase(), 0);
              },
              itemBuilder: (BuildContext context, String? suggestion) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        suggestion ?? '',
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () => widget.onPressed,
            child: const Icon(Icons.search_sharp, size: 35, color: Colors.blue,),
          )
        ],
      ),
    );
  }
}
