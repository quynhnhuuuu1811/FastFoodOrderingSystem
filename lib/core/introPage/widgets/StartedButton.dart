import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/signInPage/presentation/screens/signInScreen.dart';

class ButtonStarted extends StatelessWidget {
  const ButtonStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.white
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Bắt đầu ngay',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontFamily: 'Anton',
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward,
            size: 40,
            color: Colors.black,),
        ],
      ),
    );
  }
}
