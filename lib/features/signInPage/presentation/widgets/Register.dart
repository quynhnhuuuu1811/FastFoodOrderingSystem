import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {  },
            child:Text('Đăng kí ngay',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17
                )))
      ],
    );
  }
}