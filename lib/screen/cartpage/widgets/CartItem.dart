import 'package:flutter/material.dart';
import '../../widget/AmountTextfield.dart';
import '../../widget/IconInContainer.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.productName,
    required this.amountController,
    required this.onCheckedChange,
  }) : super(key: key);

  final TextEditingController amountController;
  final String productName;
  final ValueChanged<bool> onCheckedChange;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;

  void toggleChecked(bool? value) {
    setState(() {
      isChecked = !isChecked;
      widget.onCheckedChange(isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: toggleChecked,
          ),
          Expanded(
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
                      width: 110,
                      height: 110,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(width: 10), // thêm khoảng cách giữa ảnh và text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                            fontSize: 22,
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
                    const SizedBox(width: 20),
                    IconInContainer(
                      icon: Icons.remove,
                      colorIcon: Colors.white,
                      color: Colors.black,
                      iconSize: 15,
                      containerSize: 30,
                    ),
                    AmountTextfield(
                      amountController: widget.amountController,
                      containerSize: 30,
                      fontsize: 20,
                    ),
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
          ),
        ],
      ),
    );
  }
}
