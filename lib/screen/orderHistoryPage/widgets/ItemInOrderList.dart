import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../../widget/TextButtons.dart';
import 'ItemofOrder.dart';

class ItemInOrderList extends StatelessWidget {
  ItemInOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mã đơn hàng',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Shopee_Medium',
                      fontSize: 20
                  )),
              const Text('123abcxyz',
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Shopee_medium'
                ),),
              const SizedBox(height:10),
              ItemofOrder(
                  title: 'Địa chỉ', content: '02 Võ Oanh, Bình Thạnh, HCM'),
              ItemofOrder(
                title: 'Ghi chú',
                content: 'Cho thêm tương ớt',
              ),
              Divider(color: Colors.black38,),
              ItemofOrder(
                  title: 'Tổng tiền',
                  content: '123000VND'),
              Align(
                alignment: Alignment.centerRight,
                child: TextButtons(
                  onpressed: (){},
                  text: 'Xem chi tiết',
                  textSize: 18,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        )
    );
  }
}

