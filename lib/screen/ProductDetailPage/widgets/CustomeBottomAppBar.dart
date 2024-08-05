import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../../widget/AmountTextfield.dart';
import '../../widget/IconInContainer.dart';

class CustomeBottomAppBar extends StatelessWidget {
  const CustomeBottomAppBar({
    super.key,
    required TextEditingController amountController,
  }) : _amountController = amountController;

  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: AppColors.grayColor,
        height: 120,
        child: Row(
            children:[
              IconInContainer(
                icon:Icons.add,
                color: Colors.white,
                colorIcon: Colors.black,
                containerSize: 40,
                iconSize: 20,
              ),
              AmountTextfield(
                amountController: _amountController,
                fontsize: 25,
                containerSize: 40,),
              IconInContainer(
                icon:Icons.remove,
                color: Colors.white,
                colorIcon: Colors.black,
                iconSize: 20,
                containerSize: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    const Text(
                        'Tổng cộng: 123000 VND',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21
                        )
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed:(){},
                        child: const Text('Thêm vào giỏ hàng',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ))

                  ],
                ),
              )
            ]
        )
    );
  }
}
