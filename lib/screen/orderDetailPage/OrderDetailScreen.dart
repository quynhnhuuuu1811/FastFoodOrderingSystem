
import 'package:fastfood_ordering_system/features/order/dtos/order_success_dto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/app_color.dart';
import 'widgets/OrderDetailInformation.dart';
import 'widgets/OrderDetailItem.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key,required this.order});

  final OrderSuccessDto order;
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
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
                content: widget.order.address,
                icon: Icons.location_on,
              ),
              const SizedBox(height: 5),
              const Divider(),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.order.foodForOrderDto.length,
                    itemBuilder: (context, index) {
                      final item = widget.order.foodForOrderDto[index];
                      return OrderDetailItem(
                        productname: item.name,
                        price: item.price,
                        quantity: item.orderDetailDto.quantity,
                        image_url: item.image,
                      );
                    },
                  ),
                  OrderDetailInformation(
                    title: 'Ghi chú',
                    content: widget.order.note,
                    icon: Icons.note,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng tiền',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${widget.order.total} VND',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}