import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../ProductDetailPage/ProductDetailScreen.dart';
import '../widget/ProductItem.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go(RouteName.category);
          },
        ),
        title: const Text(
          'Món ngon bán chạy',
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
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          children: [
            Stack(
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
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Text(
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
            ),
          ],
        ),
      ),
    );
  }
}
