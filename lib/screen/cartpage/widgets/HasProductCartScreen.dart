import 'package:flutter/cupertino.dart';

import 'CartItem.dart';

class HasProductCartScreen extends StatelessWidget {
  const HasProductCartScreen({
    super.key,
    required List<String> productNames,
    required TextEditingController amountController,
  }) : _productNames = productNames, _amountController = amountController;

  final List<String> _productNames;
  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: _productNames.map((name) {
            return CartItem(
              amountController: _amountController,
              productName: name,
            );
          }).toList(),
        ),
      ),
    );
  }
}