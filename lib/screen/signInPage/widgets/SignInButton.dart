import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        backgroundColor: Colors.black,
      ),
      onPressed: () { },
      child: Text(
          'Đăng nhập',
          style:TextStyle(
              color: Colors.white,
              fontSize: 18
          )
      ),
    );
  }
}
