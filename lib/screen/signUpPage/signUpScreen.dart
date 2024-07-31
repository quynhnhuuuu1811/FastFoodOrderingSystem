import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:fastfood_ordering_system/screen/signUpPage/widgets/TextFieldSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




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
            child: Container(
              width: 350,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children:[
                    Text('Đăng ký',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Shopee_Bold',
                    )
                    ),
                    TextFieldSignUp(
                      controller: _phoneController,
                      hintText:'Nhập số điện thọai',
                      icon: Icons.phone,
                      isPassword:false
                    )

                  ]
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
