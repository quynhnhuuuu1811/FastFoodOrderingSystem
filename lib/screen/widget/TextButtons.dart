import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({
    super.key,
    required this.text,
    required this.destination,
    required this.textSize,
    required this.textColor
  });

  final String text;
  final Widget destination;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
        child:Text(text,
            style: TextStyle(
                color:textColor,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor:textColor,
                decorationThickness: 2
            )));
  }
}