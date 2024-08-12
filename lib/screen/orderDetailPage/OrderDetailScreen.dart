import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/RoundedButton.dart';
import '../widget/TextButtons.dart';
import 'widgets/OrderDetailInformation.dart';
import 'widgets/OrderDetailItem.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final List<Map<String, dynamic>> orderDetailList = [
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 1', 'price': 123000, 'quantity': 1},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 2', 'price': 123000, 'quantity': 2},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 3', 'price': 123000, 'quantity': 3},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 4', 'price': 123000, 'quantity': 4},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 5', 'price': 123000, 'quantity': 5},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 6', 'price': 123000, 'quantity': 6},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 7', 'price': 123000, 'quantity': 7},
  ];

  final int totalAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go(RouteName.orderHistory);
          },
        ),
        title: const Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Shopee_Bold',
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderDetailInformation(
                title: 'Địa chỉ giao hàng',
                content: '02 Võ Oanh, Bình Thạnh, HCM',
                icon: Icons.location_on,
              ),
              const SizedBox(height: 5),
              const Divider(),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderDetailList.length,
                    itemBuilder: (context, index) {
                      final item = orderDetailList[index];
                      return OrderDetailItem(
                        productname: item['productName'],
                        price: item['price'],
                        quantity: item['quantity'],
                        image_url: item['image_url'],
                      );
                    },
                  ),
                  OrderDetailInformation(
                    title: 'Ghi chú',
                    content: 'Giao hàng nhanh',
                    icon: Icons.note,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$totalAmount VND',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:100)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
