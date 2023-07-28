import 'package:flutter/material.dart';

Future customDialog(String title, BuildContext context) async{
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(title),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Quay lại'),
          )
        ],
      ),
    );
  }