import 'package:flutter/material.dart';

class AmountTextfield extends StatelessWidget {
  const AmountTextfield({
    super.key,
    required this.quantity,
    required this.fontsize,
    required this.containerSize
  }) ;


  final double fontsize;
  final double containerSize;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController=TextEditingController(text: quantity.toString());

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2),
      ),
      child: Center(
        child: TextField(
          controller: _amountController,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontsize,
              fontWeight: FontWeight.bold
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}