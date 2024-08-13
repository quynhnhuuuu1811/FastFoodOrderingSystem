import 'package:fastfood_ordering_system/features/foods/bloc/food_bloc.dart';
import 'package:fastfood_ordering_system/features/foods/data/food_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../config/http_client.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../../features/foods/data/food_api_client.dart';
import '../widget/ProductItem.dart';

class listProductScreen extends StatefulWidget {
  listProductScreen({super.key,required this.categoryId});
  int categoryId;
  @override
  State<listProductScreen> createState() => _listProductScreenState();
}

class _listProductScreenState extends State<listProductScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FoodRepository(
          foodApiClient: FoodApiClient(dio: dio)
      ),
      child: BlocProvider(
        create: (context) => FoodBloc(
            context.read<FoodRepository>()
        )
          ..add(
              FetchFoodsByCategory(widget.categoryId)
          ),
        child: Builder(
          builder: (context) {
            final foodState = context.watch<FoodBloc>().state;
            if(foodState.status == FoodStatus.loading){
              return const Center(child: CircularProgressIndicator());
            }
            else if(foodState.status == FoodStatus.failure){
              return const Center(child: Text('Failed to load foods'));
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
                  foodState.foods[0].category.name,
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
          }
        ),
      ),
    );
  }
}
