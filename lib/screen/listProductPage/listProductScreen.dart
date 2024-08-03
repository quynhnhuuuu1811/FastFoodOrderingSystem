import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../core/constant/app_color.dart';
import '../widget/ProductItem.dart';

class listProductScreen extends StatefulWidget {
  const listProductScreen({super.key});

  @override
  State<listProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<listProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'Category name',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Shopee_Bold',
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            ProductItem(),
          ],
        ),
      ),
    );
  }
}
