import 'package:fastfood_ordering_system/features/cart/dtos/food_for_cart_dto.dart';
import 'package:flutter/material.dart';
import '../../widget/AmountTextfield.dart';
import '../../widget/IconInContainer.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.food,

    required this.onCheckedChange,
  }) : super(key: key);

  final FoodForCartDto food;
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
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              height: 130,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Image.network(
                      widget.food.image,
                      width: 110,
                      height: 110,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(width: 10), // Space between image and text
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Shopee_Medium',
                            ),
                          ),
                          Text(
                            widget.food.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconInContainer(
                      onPressed: () {},
                      icon: Icons.remove,
                      colorIcon: Colors.white,
                      color: Colors.black,
                      iconSize: 15,
                      containerSize: 30,
                    ),
                    AmountTextfield(
                      containerSize: 30,
                      fontsize: 20, quantity: widget.food.cartFoodDto.quantity,
                    ),
                    IconInContainer(
                      onPressed: () {},
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
