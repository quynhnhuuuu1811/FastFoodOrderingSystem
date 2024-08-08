import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationItem extends StatefulWidget {
  final String title;
  final String content;
  final bool isPassword;

  InformationItem({
    Key? key,
    required this.title,
    required this.content,
    required this.isPassword,
  }) : super(key: key);

  @override
  _InformationItemState createState() => _InformationItemState();
}

class _InformationItemState extends State<InformationItem> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontFamily: 'Shopee_Bold',
            ),
          ),
          if (widget.isPassword)
            Row(
              children: [
                Text(
                  _obscureText ? '*' * widget.content.length : widget.content,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Shopee_Medium',
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ],
            )
          else
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 27,
                fontFamily: 'Shopee_Medium',
              ),
            ),
        ],
      ),
    );
  }
}
