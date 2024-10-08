import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/routes.dart';
import '../../signUpPage/signUpScreen.dart';
import '../../widget/TextButtons.dart';

class Register extends StatelessWidget {
  const Register({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Chưa có tài khoản?',
            style: TextStyle(
                fontSize: 17
            )),
        TextButtons(
          text:'Đăng kí ngay!',
          textColor: Colors.black,
          textSize: 18,
          onpressed: (){
            context.go(RouteName.register);
          },
        )
      ],
    );
  }
}