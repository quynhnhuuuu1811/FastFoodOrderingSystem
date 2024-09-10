import 'package:fastfood_ordering_system/features/foods/bloc/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/ProductItem.dart';

class ListProductScreen extends StatefulWidget {
  final int categoryId;

  ListProductScreen({super.key, required this.categoryId});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch FetchFoodsByCategory event when the screen is initialized
    context.read<FoodBloc>().add(FetchFoodsByCategory(widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        final foodState = state;

        if (foodState.status == FoodStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (foodState.status == FoodStatus.failure) {
          return const Center(child: Text('Failed to load foods'));
        } else if (foodState.foods.isEmpty) {
          return const Center(child: Text('No foods available'));
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.go(RouteName.category);
              },
            ),
            title: Text(
              foodState.foods.isNotEmpty ? foodState.foods[0].category.name : 'No Category',
              style: const TextStyle(
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
              mainAxisSpacing: 20,
              children: foodState.foods.map((food) {
                return ProductItem(
                  food: food,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
