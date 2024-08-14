import 'package:fastfood_ordering_system/features/countController/bloc/count_controller_bloc.dart';
import 'package:fastfood_ordering_system/features/foods/dtos/food_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/app_color.dart';
import '../../../features/cart/bloc/cart_bloc.dart';
import '../../../utils/token.dart';
import '../../widget/AmountTextfield.dart';
import '../../widget/IconInContainer.dart';

class CustomeBottomAppBar extends StatefulWidget {
  const CustomeBottomAppBar({
    super.key,
    required this.food,
  });
  final FoodDto food;

  @override
  State<CustomeBottomAppBar> createState() => _CustomeBottomAppBarState();
}

class _CustomeBottomAppBarState extends State<CustomeBottomAppBar> {
  Future<String> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');
    return getUserIdFromToken(accessToken!);
  }
  @override
  void initState() {
    super.initState();
    context.read<CountControllerBloc>().add(Reset());
  }
  @override
  Widget build(BuildContext context) {
    final quantity = context.watch<CountControllerBloc>().state.quantityMap[widget.food.id] ?? 1;

    return BottomAppBar(
      color: AppColors.grayColor,
      height: 120,
      child: FutureBuilder<String>(
        future: getUserId(), // Call getUserId here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userId = snapshot.data!;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconInContainer(
                  onPressed: () {
                    context.read<CountControllerBloc>().add(Decrement(widget.food.id));
                  },
                  icon: Icons.remove,
                  color: Colors.white,
                  colorIcon: Colors.black,
                  containerSize: 40,
                  iconSize: 20,
                ),
                AmountTextfield(
                  quantity: quantity,
                  fontsize: 25,
                  containerSize: 40,
                ),
                IconInContainer(
                  onPressed: () {
                    context.read<CountControllerBloc>().add(Increment(widget.food.id));
                  },
                  icon: Icons.add,
                  color: Colors.white,
                  colorIcon: Colors.black,
                  iconSize: 20,
                  containerSize: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng cộng: ${widget.food.price * quantity} VND',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(
                              AddFoodToCart(
                                userId: int.parse(userId),
                                foodId: widget.food.id,
                                quantity: quantity,
                              ),
                            );
                            SnackBar snackBar =  SnackBar(
                              content: Text('Đã thêm ${widget.food.name} giỏ hàng'),
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: const Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
