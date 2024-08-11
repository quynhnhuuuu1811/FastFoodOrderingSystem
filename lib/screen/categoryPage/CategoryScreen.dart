import 'package:fastfood_ordering_system/config/http_client.dart';
import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/features/category/data/category_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_color.dart';
import '../../features/category/bloc/category_bloc.dart';
import '../../features/category/data/category_repository.dart';
import '../widget/CustomeIconButton.dart';
import '../widget/ItemofGridView.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CategoryRepository(
        CategoryApiClient: CategoryApiClient(dio: dio)
      ),
      child: BlocProvider(
        create: (context) => CategoryBloc(context.read<CategoryRepository>())..add(FetchCategories()),
        child: Builder(
          builder: (context) {
            final categoryState = context.watch<CategoryBloc>().state;

            if (categoryState.status == CategoryStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (categoryState.status == CategoryStatus.error) {
              return const Center(child: Text('Failed to load categories'));
            }

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  'Fast Food Ordering',
                  style: TextStyle(color: Colors.black, fontFamily: 'Shopee_Bold'),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    context.pop();
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
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: categoryState.categories.map((category) {
                    return ItemofGridView(
                      picturePath: category.image,
                      text: category.name,
                      height: 120,
                      onTap: () {
                        context.go(RouteName.listProduct, extra: category.id);
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
