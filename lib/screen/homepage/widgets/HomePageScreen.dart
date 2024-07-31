import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.yellowColor,
        automaticallyImplyLeading: false,
        title:const Align(
          alignment: Alignment.center,
          child: Row(
            children:[
              Icon(Icons.account_circle,
              color: Colors.white,
              size: 30),
              SizedBox(width: 10),
              Text('Tên người dùng',
            style:TextStyle(
              fontFamily:'Shopee_Medium',
              color: Colors.white,
              fontSize: 25
                )
              ),
              ]
          ),
        ),
        actions:[
          Row(
            children:[
              IconButton(onPressed: (){},
                  icon: Icon(Icons.shopping_cart))
            ]
          )
        ]
      )
    );
  }
}
