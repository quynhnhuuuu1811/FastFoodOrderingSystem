import 'package:fastfood_ordering_system/screen/bestSellerPage/widgets/BestSellerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';
import '../../features/order/bloc/order_bloc.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(GetBestSeller());
  }
  @override
  Widget build(BuildContext context) {
    final orderState =context.watch<OrderBloc>().state;
    if(orderState.status == OrderStatus.loading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(orderState.status == OrderStatus.failure){
      return const Center(
        child: Text('Load data error'),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
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
          mainAxisSpacing: 10,
          children: orderState.bestSeller.map((e) => BestSellerItem(food: e)).toList(),
        ),
      ),
    );
  }
}
