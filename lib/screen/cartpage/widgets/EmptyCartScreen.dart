import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/empty_cart.png'),
            height: 250,
          ),
          SizedBox(height: 10),
          Text(
            'Giỏ hàng trống',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}