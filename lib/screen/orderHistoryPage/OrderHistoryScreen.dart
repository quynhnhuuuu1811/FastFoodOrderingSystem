import 'dart:ui';

import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/screen/orderHistoryPage/widgets/ItemInOrderList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constant/app_color.dart';
import '../../features/order/bloc/order_bloc.dart';
import '../../utils/token.dart';
import '../widget/CustomeIconButton.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int userId =0;

  @override
  void initState() {
    super.initState();
    _loadUserId().then((userId) {
      if (userId != null) {
        context.read<OrderBloc>().add(GetOrderByUserId(userId: userId));
      }
    });
  }

  Future<int?> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    if (token != null) {
      return int.tryParse(getUserIdFromToken(token));
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final orderState = context.watch<OrderBloc>().state;
    if(orderState.status==OrderStatus.loading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(orderState.status==OrderStatus.failure){
      return const Center(
        child: Text('Có lỗi xảy ra'),
      );
    }
    print(orderState.orders);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Lịch sử mua hàng',
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
        actions: [
          CustomeIconButton(
            icon: Icons.shopping_cart,
            color: Colors.black,
            onpressed: () {
              context.push(RouteName.cart);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView (
          children: orderState.orders.map((order) => ItemInOrderHistoryList(orderSuccessDto: order)).toList(),
        ),
      )

    );
  }
}
