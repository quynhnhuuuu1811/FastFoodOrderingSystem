import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:fastfood_ordering_system/screen/homepage/HomePageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/validate.dart';
import '../signInPage/signInScreen.dart';
import '../widget/RoundedButton.dart';
import '../widget/TextButtons.dart';
import '../widget/TextField.dart';




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _phoneController =  TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _checkpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/signUpbkg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 350,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
              
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,50,20,50),
                  child: Column(
                    children:[
                      SizedBox(height: 30),
                      Text('Đăng ký',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Shopee_Bold',
                      )
                      ),
                      SizedBox(height: 20),
                      RoundedTextField(
                        controller: _phoneController,
                        hintText:'Nhập số điện thọai',
                        icon: Icons.phone,
                        isPassword:false,
                        selectColor: Colors.white,
                        keyboardType: TextInputType.phone,
                        hintTextColor: AppColors.grayColor,
                        textInputAction: TextInputAction.next,
                        validator:validatePhoneNumber ,
                      ),
                      RoundedTextField(
                        controller: _fullnameController,
                        hintText:'Nhập họ và tên',
                        icon: Icons.account_box,
                        isPassword:false,
                        selectColor: Colors.white,
                        keyboardType: TextInputType.name,
                        hintTextColor: AppColors.grayColor,
                        textInputAction: TextInputAction.next,
                        validator:validateFullName ,
                      ),
              
                      RoundedTextField(
                        controller: _passwordController,
                        hintText:'Nhập mật khẩu (ít nhất 8 ký tự)',
                        icon: Icons.key,
                        isPassword:true,
                        selectColor: Colors.white,
                        keyboardType: TextInputType.text,
                        hintTextColor: AppColors.grayColor,
                        textInputAction: TextInputAction.next,
                        validator: validatePassword,
                      ),
                      RoundedTextField(
                        controller: _checkpasswordController,
                        hintText:'Nhập lại mật khẩu',
                        icon: Icons.check,
                        isPassword:true,
                        selectColor: Colors.white,
                        keyboardType: TextInputType.text,
                        hintTextColor: AppColors.grayColor,
                        textInputAction: TextInputAction.done,
                        validator: (value)=>validateConfirmPassword(_passwordController.text, value),
                      ),
                      const SizedBox(height:30),
                      RoundedButton(
                        buttonColor: Colors.white,
                        buttonText: 'Đăng kí ngay',
                        fontSize: 20,
                        textColor: Colors.black,
                        onpressed: (){},
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(180,10,0,10),
                        child: TextButtons(
                          text: "Quay về",
                          textColor: Colors.white,
                          textSize: 20,
                          onpressed: (){
                            Navigator.pop(context);
                          }
                        ),
                      )
              
                    ]
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

