import 'package:fastfood_ordering_system/screen/widget/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes.dart';
import 'CartItem.dart';

class HasProductCartScreen extends StatefulWidget {
  const HasProductCartScreen({
    Key? key,
    required this.productNames,
    required this.amountController,
  }) : super(key: key);

  final List<String> productNames;
  final TextEditingController amountController;

  @override
  _HasProductCartScreenState createState() => _HasProductCartScreenState();
}

class _HasProductCartScreenState extends State<HasProductCartScreen> {
  late List<bool> _checkedStates;

  @override
  void initState() {
    super.initState();
    _checkedStates = List<bool>.filled(widget.productNames.length, false);
  }

  void _onCheckedChange(int index, bool isChecked) {
    setState(() {
      _checkedStates[index] = isChecked;
    });
  }

  bool get _showBottomButton {
    return _checkedStates.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: widget.productNames.asMap().entries.map((entry) {
              int index = entry.key;
              String name = entry.value;
              return CartItem(
                amountController: widget.amountController,
                productName: name,
                onCheckedChange: (isChecked) => _onCheckedChange(index, isChecked),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: _showBottomButton
          ? BottomAppBar(
        color: Colors.white,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                buttonText: 'Xóa',
                fontSize: 25,
                buttonColor: Colors.black,
                textColor: Colors.white,
                font: 'Shopee_Bold',
                onpressed: () {

                },
              ),
              RoundedButton(
                buttonText: 'Thanh toán',
                fontSize: 25,
                buttonColor: Colors.black,
                textColor: Colors.white,
                font: 'Shopee_Bold',
                onpressed: () {
                  context.go(RouteName.order);
                },
              ),
            ]
          ),
        ),
      )
          : null,
    );
  }
}
