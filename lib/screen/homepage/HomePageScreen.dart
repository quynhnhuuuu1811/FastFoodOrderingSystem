import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/screen/widget/ItemofGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';

import '../widget/CustomeIconButton.dart';
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<String> imgList = [
    'assets/images/poster.png',
    'assets/images/poster2.png',
    'assets/images/poster3.png',
  ];

  final List<Map<String, dynamic>> featureList = [
    {'picturePath': 'https://firebasestorage.googleapis.com/v0/b/fast-food-ordering-syste-cdcdd.appspot.com/o/homepage_features%2Faccount.jpg?alt=media&token=c4f4c5c5-7600-4b05-ba4f-6e3884cdf107', 'text': 'Tài khoản', 'route': RouteName.account},
    {'picturePath': 'https://firebasestorage.googleapis.com/v0/b/fast-food-ordering-syste-cdcdd.appspot.com/o/homepage_features%2Fbest_seller.jpg?alt=media&token=712374a0-c52f-467a-9e80-fe1eddbfd28f', 'text': 'Đặt hàng', 'route': RouteName.category},
    {'picturePath': 'https://firebasestorage.googleapis.com/v0/b/fast-food-ordering-syste-cdcdd.appspot.com/o/homepage_features%2Finvoice.jpg?alt=media&token=0b6c079a-b63d-44dc-a51e-ea4edabcceb1', 'text': 'Lịch sử mua hàng', 'route': RouteName.orderHistory},
    {'picturePath': 'https://firebasestorage.googleapis.com/v0/b/fast-food-ordering-syste-cdcdd.appspot.com/o/homepage_features%2Ffavorite.jpg?alt=media&token=7751ad74-ac1a-41ef-8acc-0571e8a9ceb0', 'text': 'Bán chạy', 'route': RouteName.bestSeller},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/logo_nentrang.png'),
              height: 55,
              width: 55,
            ),
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
        actions: [
          CustomeIconButton(
            icon: Icons.shopping_cart,
            color: Colors.black,
            onpressed: () {
              context.push(RouteName.cart);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 270,
                width: double.infinity,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: imgList.length,pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: AppColors.yellowColor,
                      color: Colors.white,
                      size: 10,
                      activeSize: 12,
                    )
                ),
                  control: const SwiperControl(
                    color: Colors.black,
                    disableColor: Colors.red,

                  ),
                ),
              ),
              const Divider(
                color: AppColors.grayColor,
                thickness: 1.5,
              ),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: featureList.map((feature) {
                    return ItemofGridView(
                      picturePath: feature['picturePath']!,
                      text: feature['text']!,
                      height:80,
                      onTap: () {
                        context.go(feature['route']!);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}