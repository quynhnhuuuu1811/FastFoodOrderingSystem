import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.productname,
    required this.price,
    required this.quantity,
    required this.image_url
  });

  final String productname;
  final int price;
  final int quantity;
  final String image_url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image(
            image: NetworkImage(image_url),
            width: 120,
            height: 120,
            fit: BoxFit.fitHeight,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                productname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '$price VND', // Hiển thị giá với đơn vị tiền tệ
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Số lượng: $quantity', // Hiển thị số lượng sản phẩm
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
