import 'package:fastfood_ordering_system/features/category/dtos/category_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/foods/dtos/food_dto.dart';
import '../../ProductDetailPage/ProductDetailScreen.dart';
import '../../widget/ProductItem.dart';

class BestSellerItem extends StatelessWidget {
  BestSellerItem({
    super.key,
    required this.food,
  });

  final FoodDto food;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProductItem(
          food: food
        ),
        Positioned(
          top: 0,
          right: 20,
          child: Container(
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: const Text(
              'Bán chạy',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
