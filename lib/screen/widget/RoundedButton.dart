import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    this.iconColor,
    required this.buttonText,
    this.font,
    this.icon,
    required this.fontSize,
    required this.onpressed
  });

  final Color buttonColor;
  final Color textColor;
  final Color? iconColor;
  final String buttonText;
  final String? font;
  final Icon? icon;
  final double fontSize;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onpressed ,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: buttonColor,
      ),
      child: Center(
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
            const SizedBox(width: 8),
            if (icon != null) ...[ // Kiểm tra xem icon có được cung cấp không
              const SizedBox(width: 8),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
