import 'package:flutter/material.dart';

class MyWidgets {
  static showSnackbar(
      {required String msg,
      required BuildContext context,
      Color bgColor = Colors.black87,
      Color msgColor = Colors.white,
      int duration = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: duration),
      ),
    );
  }
}
