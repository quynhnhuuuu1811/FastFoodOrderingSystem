import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailInformation extends StatelessWidget {
  const OrderDetailInformation({
    super.key,
    required this.title,
    required this.icon,
    required this.content
  });

  final String title;
  final IconData? icon;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Shopee_Bold',
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontFamily: 'Shopee_Medium',
                fontSize: 18,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}