import 'package:fastfood_ordering_system/screen/introPage/IntroScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(), // Sử dụng tên lớp chính xác cho màn hình giới thiệu
    );
  }
}
