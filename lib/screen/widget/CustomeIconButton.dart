import 'package:flutter/material.dart';

class CustomeIconButton extends StatelessWidget {
  CustomeIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onpressed
  });

  late IconData icon;
  late Color color;
  late VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onpressed,
        icon: Icon(icon),
        color: color);
  }
}
