import 'package:flutter/material.dart';

import '../../widget/AmountTextfield.dart';
import '../../widget/IconInContainer.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.productName,
    required TextEditingController amountController,
  }) : _amountController = amountController;

  final TextEditingController _amountController;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/images/demo.png',
                width: 120,
                height: 120,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 10), // thêm khoảng cách giữa ảnh và text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontFamily: 'Shopee_Medium',
                    ),
                  ),
                  const Text('123000 VND',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      )),
                ],
              ),
              SizedBox(width: 40),
              IconInContainer(
                icon: Icons.remove,
                colorIcon: Colors.white,
                color: Colors.black,
                iconSize: 15,
                containerSize: 30,
              ),
              AmountTextfield(
                amountController: _amountController,
                containerSize: 30,
                fontsize: 20,),
              IconInContainer(
                icon: Icons.add,
                colorIcon: Colors.white,
                color: Colors.black,
                iconSize: 15,
                containerSize: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}