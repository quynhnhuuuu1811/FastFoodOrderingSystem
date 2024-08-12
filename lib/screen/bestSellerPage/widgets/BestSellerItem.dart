import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ProductDetailPage/ProductDetailScreen.dart';
import '../../widget/ProductItem.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProductItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailScreen(),
              ),
            );
          },
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
