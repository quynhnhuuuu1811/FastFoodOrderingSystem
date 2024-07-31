import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../signUpPage/signUpScreen.dart';

class Register extends StatelessWidget {
  const Register({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chưa có tài khoản?',
            style: TextStyle(
                fontSize: 17
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            child:Text('Đăng kí ngay',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18
                )))
      ],
    );
  }
}