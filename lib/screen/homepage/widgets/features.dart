import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturesInHomePage extends StatelessWidget {
  final String picturePath;
  final String text;
  final VoidCallback onTap;
  const FeaturesInHomePage({
    super.key,
    required this.picturePath,
    required this.text,
    required this.onTap
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
                height: 80,
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
