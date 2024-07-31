import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Register.dart';
import '../widgets/SignInButton.dart';
import '../widgets/TextFieldSignIn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Widget
              Center(
                child: Image.asset(
                  'assets/images/logo_nentrang.png',
                  height: 400,
                  width: 400,
                ),
              ),

              TextFieldSignIn(
                controller: phoneController,
                hintText: 'Nhập số điện thoại',
                icon: Icons.account_box,
                isPassword: false, // Not a password field
              ),
              const SizedBox(height: 20), // Add more space if needed
              TextFieldSignIn(
                controller: passwordController,
                hintText: 'Nhập mật khẩu',
                icon: Icons.lock,
                isPassword: true, // Password field
              ),
              SizedBox(height: 30),
              SignInButton(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}
