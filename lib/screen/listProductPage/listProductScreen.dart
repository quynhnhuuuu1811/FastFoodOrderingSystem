import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../ProductDetailPage/ProductDetailScreen.dart';
import '../widget/ProductItem.dart';

class listProductScreen extends StatefulWidget {
  const listProductScreen({super.key});

  @override
  State<listProductScreen> createState() => _listProductScreenState();
}

class _listProductScreenState extends State<listProductScreen> {
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
          'Category name',
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
          crossAxisSpacing: 20,
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
            // Add more ProductItem widgets as needed
          ],
        ),
      ),
    );
  }
}
