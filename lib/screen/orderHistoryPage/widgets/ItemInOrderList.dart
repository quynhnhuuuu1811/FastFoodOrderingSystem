import 'package:fastfood_ordering_system/features/order/dtos/order_success_dto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes.dart';
import '../../../core/constant/app_color.dart';
import '../../widget/TextButtons.dart';
import 'ItemofOrderHistory.dart';

class ItemInOrderHistoryList extends StatelessWidget {
  ItemInOrderHistoryList({
    required this.orderSuccessDto,
    super.key,
  });
  final OrderSuccessDto orderSuccessDto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          decoration:BoxDecoration(
              color: AppColors.lightgrayColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: AppColors.containerColor,
                  width: 1
              )
          ),
          height:270,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mã đơn hàng',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Shopee_Medium',
                        fontSize: 20
                    )),
                Text(orderSuccessDto.id.toString(),
                  style: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Shopee_medium'
                  ),),
                const SizedBox(height:10),
                ItemofOrderHistory(
                    title: 'Địa chỉ', content: orderSuccessDto.address),
                ItemofOrderHistory(
                  title: 'Ghi chú',
                  content: orderSuccessDto.note,
                ),
                const Divider(color: Colors.black38,),
                ItemofOrderHistory(
                    title: 'Tổng tiền',
                    content: '${orderSuccessDto.total}đ'),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButtons(
                    onpressed: (){
                      context.push(RouteName.orderDetail ,extra: orderSuccessDto);
                    },
                    text: 'Xem chi tiết',
                    textSize: 18,
                    textColor: Colors.black,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}