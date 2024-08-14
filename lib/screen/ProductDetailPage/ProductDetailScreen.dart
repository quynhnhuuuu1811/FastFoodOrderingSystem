import 'package:fastfood_ordering_system/features/foods/dtos/food_dto.dart';
import 'package:flutter/material.dart';
import 'package:fastfood_ordering_system/screen/ProductDetailPage/widgets/CustomeBottomAppBar.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key,required this.food});
  final FoodDto food;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 35),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              width: screenWidth,
              widget.food.image,
              height: 400,
            ),
            const Divider(color: AppColors.grayColor, thickness: 2),
             Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Shopee_Bold',
                    ),
                  ),

                  Text(
                    '${widget.food.price} VND',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Shopee_Medium',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomeBottomAppBar(food:widget.food,),
    );
  }
}
