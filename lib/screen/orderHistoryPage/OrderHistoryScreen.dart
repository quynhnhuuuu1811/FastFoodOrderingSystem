import 'dart:ui';

import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/screen/orderHistoryPage/widgets/ItemInOrderList.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';
import '../widget/CustomeIconButton.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go(RouteName.home);
          },
        ),
        actions: [
          CustomeIconButton(
            icon: Icons.shopping_cart,
            color: Colors.black,
            onpressed: () {
              context.go(RouteName.cart);
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
        padding: EdgeInsets.all(10),
        child: Column (
          children: [
            ItemInOrderHistoryList()
          ]
        ),
      )

    );
  }
}
