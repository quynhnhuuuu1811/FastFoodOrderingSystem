import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({
    super.key,
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.onpressed
  });

  final String text;
  final double textSize;
  final Color textColor;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
        child:Text(text,
            style: TextStyle(
                color:textColor,
                fontSize: textSize,
                decoration: TextDecoration.underline,
                decorationColor:textColor,
                decorationThickness: 2
            )
        )
    );
  }
}