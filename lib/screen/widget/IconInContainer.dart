import 'package:flutter/material.dart';

class IconInContainer extends StatelessWidget {
  IconInContainer({
    super.key,
    required this. icon,
    required this.color,
    required this.colorIcon
  });

  final IconData icon;
  final Color color;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:5,right: 5),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 20,
            ),
            color: colorIcon,
          ),
        ),
      ),
    );
  }
}