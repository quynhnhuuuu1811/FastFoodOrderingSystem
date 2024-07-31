import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:fastfood_ordering_system/screen/homepage/widgets/HomePageScreen.dart';
import 'package:fastfood_ordering_system/screen/signInPage/widgets/Register.dart';
import 'package:fastfood_ordering_system/screen/widget/TextField.dart';
import 'package:flutter/material.dart';

import '../signUpPage/signUpScreen.dart';
import '../widget/RoundedButton.dart';


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
                  height: 370,
                  width: 370,
                ),
              ),

              RoundedTextField(
                controller: phoneController,
                hintText: 'Nhập số điện thoại',
                icon: Icons.account_box,
                isPassword: false,
                selectColor: Colors.black,
                keyboardType: TextInputType.number,
                hintTextColor: AppColors.grayColor,
              ),
              RoundedTextField(
                controller: passwordController,
                hintText: 'Nhập mật khẩu',
                icon: Icons.key,
                isPassword: false,
                selectColor: Colors.black,
                keyboardType: TextInputType.text,
                hintTextColor: AppColors.grayColor,
              ),
              const SizedBox(height: 20), // Add more space if needed
              SizedBox(height: 20),
              RoundedButton(
                buttonText: 'Đăng nhập',
                textColor: Colors.white,
                buttonColor: Colors.black,
                destination: HomePageScreen(),
                fontSize: 20

              ),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}
