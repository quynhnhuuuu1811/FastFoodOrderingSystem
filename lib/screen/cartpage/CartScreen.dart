import 'package:fastfood_ordering_system/screen/cartpage/widgets/CartItem.dart';
import 'package:fastfood_ordering_system/screen/cartpage/widgets/EmptyCartScreen.dart';
import 'package:fastfood_ordering_system/screen/cartpage/widgets/HasProductCartScreen.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _amountController = TextEditingController(text: '1');
  final List<String> _productNames = ['Sản phẩm 1', 'Sản phẩm 2', 'Sản phẩm 3'];
  bool showDeleteButton = false;

  void onCheckedChange(isChecked) {
    setState(() {
      showDeleteButton = isChecked;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: const Text(
          'Giỏ hàng',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Shopee_Bold',
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: _productNames.isEmpty
          ? const EmptyCartScreen()
          : HasProductCartScreen(productNames: _productNames, amountController: _amountController),
    );
  }
}




