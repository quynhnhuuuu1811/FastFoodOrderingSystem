import 'package:flutter/material.dart';
import 'package:fastfood_ordering_system/screen/ProductDetailPage/widgets/CustomeBottomAppBar.dart';
import '../../core/constant/app_color.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController _amountController = TextEditingController(text: '1');
  bool isFavorite = false; // Removed `late` keyword

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 35),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/demo.png',
            height: 250,
            fit: BoxFit.fitHeight,
          ),
          Divider(color: AppColors.grayColor, thickness: 2),
          Padding(
            padding: EdgeInsets.only(top:20,left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên sản phẩm',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Shopee_Bold',
                      ),
                    ),
                    SizedBox(height:10),
                    Text(
                      '123000 VND',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Shopee_Medium',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 150),
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                    size: isFavorite? 40 : 40
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomeBottomAppBar(amountController: _amountController),
    );
  }
}
