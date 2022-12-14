import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  const myButton(
      {required this.color, required this.buttonText, required this.textColor, required this.textSize, this.buttonTapped});

  final Color color;
  final Color textColor;
  final String buttonText;
  final int textSize;
  final buttonTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: buttonTapped,
          child: ClipRRect(
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor,fontSize: textSize*1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
