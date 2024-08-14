import 'package:fastfood_ordering_system/features/cart/dtos/food_for_cart_dto.dart';
import 'package:fastfood_ordering_system/screen/widget/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes.dart';
import '../../../features/order/bloc/order_bloc.dart';
import '../../../features/order/dtos/select_Items_dto.dart';
import 'CartItem.dart';

class HasProductCartScreen extends StatefulWidget {
  const HasProductCartScreen({
    Key? key,
    required this.foods,

  }) : super(key: key);

  final List<FoodForCartDto> foods;


  @override
  _HasProductCartScreenState createState() => _HasProductCartScreenState();
}

class _HasProductCartScreenState extends State<HasProductCartScreen> {
  late List<bool> _checkedStates;
  late List<SelectItemsDto> _selectedItems;

  @override
  void initState() {
    super.initState();
    _checkedStates = List<bool>.filled(widget.foods.length, false);
    _selectedItems=[];
  }

  void _onCheckedChange(int index, bool isChecked) {
    setState(() {
      _checkedStates[index] = isChecked;
      if (isChecked) {
        _selectedItems.add(SelectItemsDto(
          foodId: widget.foods[index].id,
          quantity: widget.foods[index].cartFoodDto.quantity,
          name: widget.foods[index].name,
          price: widget.foods[index].price,
          image: widget.foods[index].image,
        ));
      } else {
        _selectedItems.removeWhere((item) => item.foodId == widget.foods[index].id);
      }
    });
  }


  bool get _showBottomButton {
    return _checkedStates.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    final orderState = context.watch<OrderBloc>().state;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: widget.foods.asMap().entries.map((entry) {
              int index = entry.key;
              return CartItem(
                food: entry.value,
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
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                  // Xử lý khi nhấn nút Xóa
                },
              ),
              RoundedButton(
                buttonText: 'Thanh toán',
                fontSize: 25,
                buttonColor: Colors.black,
                textColor: Colors.white,
                font: 'Shopee_Bold',
                onpressed: () {
                  context.read<OrderBloc>().add(UpdateSelectItems(selectItems: _selectedItems));
                  context.push(RouteName.order);

                },
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }
}

