import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'widgets/StartedButton.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
                  child: ButtonStarted(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}