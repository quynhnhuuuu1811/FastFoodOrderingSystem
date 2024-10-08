import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import '../signInPage/signInScreen.dart';
import '../widget/RoundedButton.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        context.go(RouteName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/intro_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 10, 65),
              child: Transform.rotate(
                angle: -17 * pi / 180,
                child: SizedBox(
                  width: 270,
                  height: 80,
                  child: RoundedButton(
                    buttonColor: Colors.white,
                    buttonText: 'Bắt đầu ngay',
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    onpressed: () {
                      context.go(RouteName.login);
                    },
                    font: 'Anton',
                    fontSize: 30,
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
