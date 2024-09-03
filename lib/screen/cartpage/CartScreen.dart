import 'package:fastfood_ordering_system/screen/cartpage/widgets/EmptyCartScreen.dart';
import 'package:fastfood_ordering_system/screen/cartpage/widgets/HasProductCartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constant/app_color.dart';
import '../../features/cart/bloc/cart_bloc.dart';
import '../../features/order/dtos/select_Items_dto.dart';
import '../../utils/token.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int userId = 0;
@override
  void initState() {

    super.initState();
    _loadUserId().then((o)=>context.read<CartBloc>().add(GetCart(userId: userId)));

  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    if (token != null) {
      setState(() {
        userId = int.parse(getUserIdFromToken(token));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartBloc>().state;
     if(cartState.status==CartStatus.failure){
      return Center(child: Text(cartState.message));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Giỏ hàng',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Shopee_Bold',
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: cartState.cartSuccessDto.foodForCartDto.isEmpty
          ? const EmptyCartScreen()
          : HasProductCartScreen(foods:cartState.cartSuccessDto.foodForCartDto ,),
    );
  }

}




