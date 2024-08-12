import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/screen/widget/ItemofGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';
import '../cartpage/CartScreen.dart';
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
    {'picturePath': 'assets/images/account.jpg', 'text': 'Tài khoản', 'route': RouteName.account},
    {'picturePath': 'assets/images/order.jpg', 'text': 'Đặt hàng', 'route': RouteName.category},
    {'picturePath': 'assets/images/invoice.jpg', 'text': 'Lịch sử mua hàng', 'route': RouteName.orderHistory},
    {'picturePath': 'assets/images/best_seller.jpg', 'text': 'Bán chạy', 'route': RouteName.bestSeller},
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
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
                context.push(feature['route']!);
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