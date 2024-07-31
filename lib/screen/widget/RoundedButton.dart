import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    this.iconColor,
    required this.buttonText,
    required this.destination,
    this.font,
    this.icon,
    required this.fontSize
  });

  final Color buttonColor;
  final Color textColor;
  final Color? iconColor;
  final String buttonText;
  final Widget destination;
  final String? font;
  final Icon? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: buttonColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontFamily: font,
            ),
          ),
          SizedBox(width: 8),
          if (icon != null) ...[ // Kiểm tra xem icon có được cung cấp không
            SizedBox(width: 8),
            icon!,
          ],
        ],
      ),
    );
  }
}
