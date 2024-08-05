import 'package:flutter/material.dart';

class AmountTextfield extends StatelessWidget {
  const AmountTextfield({
    super.key,
    required TextEditingController amountController,
    required this.fontsize,
    required this.containerSize
  }) : _amountController = amountController;

  final TextEditingController _amountController;
  final double fontsize;
  final double containerSize;

  @override
  Widget build(BuildContext context) {
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