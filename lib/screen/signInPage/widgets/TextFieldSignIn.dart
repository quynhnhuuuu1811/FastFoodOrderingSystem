import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldSignIn extends StatelessWidget {
  const TextFieldSignIn({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isPassword,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword, // Toggle obscureText based on isPassword
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
