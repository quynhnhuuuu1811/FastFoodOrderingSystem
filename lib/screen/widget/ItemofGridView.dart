import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemofGridView extends StatelessWidget {
  final String picturePath;
  final String text;
  final VoidCallback onTap;
  final double height;
  ItemofGridView({
    super.key,
    required this.picturePath,
    required this.text,
    required this.onTap,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colors.black,
                width: 1
            )
        ),
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                picturePath,
                height: height,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Shopee_Bold',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
