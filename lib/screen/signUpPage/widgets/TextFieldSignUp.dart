import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldSignUp extends StatelessWidget {
  const TextFieldSignUp({
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white, // Set hint text color to white
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
