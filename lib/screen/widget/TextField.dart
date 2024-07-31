import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isPassword,
    required this.selectColor,
    required this.keyboardType,
    required this.hintTextColor,
    required this.textInputAction,
    required this.validator
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final Color selectColor;
  final Color hintTextColor;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: selectColor,
            size: 25,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
                fontStyle: FontStyle.italic
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:selectColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: selectColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
        style: TextStyle(
          color: selectColor
        )
      ),
    );
  }
}
