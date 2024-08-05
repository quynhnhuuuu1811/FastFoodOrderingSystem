import 'package:flutter/material.dart';

class IconInContainer extends StatelessWidget {
  IconInContainer({
    super.key,
    required this. icon,
    required this.color,
    required this.colorIcon,
    required this.containerSize,
    required this.iconSize
  });

  final IconData icon;
  final Color color;
  final Color colorIcon;
  final double containerSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:5,right: 5),
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: iconSize,
            ),
            color: colorIcon,
          ),
        ),
      ),
    );
  }
}