import 'package:fastfood_ordering_system/screen/manageProducts/widgets/EditModal.dart';
import 'package:fastfood_ordering_system/screen/manageProducts/widgets/ProductTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../config/http_client.dart';
import '../../core/constant/app_color.dart';
import '../../features/foods/bloc/food_bloc.dart';
import '../../features/foods/data/food_api_client.dart';
import '../../features/foods/data/food_repository.dart';

class ManageProductsScreen extends StatefulWidget {
  const ManageProductsScreen({super.key});

  @override
  State<ManageProductsScreen> createState() => _ManageProductsScreenState();
}

class _ManageProductsScreenState extends State<ManageProductsScreen> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Danh sách sản phẩm',
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
      body: const SingleChildScrollView(
        child: Center(
          child: ProductTable(),
        ),
      ),
    );
  }
}



