import 'dart:ffi';

import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  const myButton(
      {required this.color, required this.buttonText, required this.textColor, required this.textSize});

  final Color color;
  final Color textColor;
  final String buttonText;
  final int textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 17, 17, 17),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          padding: const EdgeInsets.all(20),
          primary: color,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor,fontSize: textSize*1.0),
          ),
        ),
      ),
    );
  }
}
