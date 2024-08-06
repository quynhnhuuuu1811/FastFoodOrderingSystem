import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';
import '../widget/CustomeIconButton.dart';
import '../widget/ItemofGridView.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, dynamic>> categoryList = [
    {'picturePath': 'assets/images/logo/burger.png', 'text': 'Burger', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/fried_chicken.png', 'text': 'Gà rán', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/drinks.png', 'text': 'Nước uống', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/fried_potatoes.png', 'text': 'Khoai tây chiên', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/hotdog.png', 'text': 'Hotdog', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/pasta.png', 'text': 'Mỳ ý ', 'route': RouteName.listProduct},
    {'picturePath': 'assets/images/logo/pizza.png', 'text': 'Pizza', 'route': RouteName.listProduct},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Fast Food Ordering',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Shopee_Bold',
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go(RouteName.home);
          },
        ),
        actions: [
          CustomeIconButton(
            icon: Icons.shopping_cart,
            color: Colors.black,
            onpressed: () {
              context.go(RouteName.cart);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: Padding (
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: categoryList.map((feature) {
            return ItemofGridView(
              picturePath: feature['picturePath']!,
              text: feature['text']!,
              height:120,
              onTap: () {
                context.go(feature['route']!);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
