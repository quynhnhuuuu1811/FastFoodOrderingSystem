
import 'package:fastfood_ordering_system/features/foods/dtos/food_dto.dart';
import 'package:fastfood_ordering_system/screen/addProductPage/addProductScreen.dart';
import 'package:fastfood_ordering_system/screen/categoryPage/CategoryScreen.dart';
import 'package:fastfood_ordering_system/screen/introPage/IntroScreen.dart';
import 'package:fastfood_ordering_system/screen/listProductPage/listProductScreen.dart';
import 'package:fastfood_ordering_system/screen/signUpPage/signUpScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/bloc/auth_bloc.dart';
import '../features/order/dtos/order_success_dto.dart';
import '../screen/EditAccountInformationPage/EditAccountInformationScreen.dart';
import '../screen/OrderPage/OrderScreen.dart';
import '../screen/ProductDetailPage/ProductDetailScreen.dart';
import '../screen/accountPage/AccountScreen.dart';
import '../screen/bestSellerPage/BestSellerScreen.dart';
import '../screen/cartpage/CartScreen.dart';
import '../screen/editPasswordPage/EditPasswordScreen.dart';
import '../screen/homepage/HomePageScreen.dart';
import '../screen/manageProducts/manageProductsScreen.dart';

import '../screen/orderDetailPage/OrderDetailScreen.dart';
import '../screen/orderHistoryPage/OrderHistoryScreen.dart';
import '../screen/signInPage/signInScreen.dart';
import 'package:fastfood_ordering_system/screen/addProductPage/addProductScreen.dart';

class RouteName{
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String intro = '/intro';
  static const String category = '/category';
  static const String cart = '/cart';
  static const String listProduct='/listProduct';
  static const String orderHistory = '/OrderHistory';
  static const String account = '/account';
  static const String editPassword = '/EditPassword';
  static const String editAccountInformation = '/editAccountInformation';
  static const String orderDetail = '/OrderDetail';
  static const String order = '/order';
  static const String bestSeller = '/bestSeller';
  static const String productDetail = '/productDetail';
  static const String manageProducts = '/ManageProducts';
  static const String addProduct = '/AddProduct';
  static const publicRoutes = [
    login,
    register,
    intro
  ];
}

final router = (String initialLocation) => GoRouter(
    initialLocation: initialLocation, // Set the initial location to intro

    routes: [
      GoRoute(path: RouteName.intro,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(path: RouteName.login,
            builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(path: RouteName.home,
        builder: (context, state) => const HomePageScreen(),
      ),
      GoRoute(path: RouteName.register,
        builder: (context, state) => const SignUpScreen()
      ),
      GoRoute(path: RouteName.category,
          builder: (context, state) => const CategoryScreen()
      ),
      GoRoute(path: RouteName.cart,
          builder: (context, state) => const CartScreen()
      ),
      GoRoute(path: RouteName.listProduct,
          builder: (context, state) {
            final categoryId = state.extra as int; // Giả sử `category.id` là String
            // Trả về widget với categoryId
            return ListProductScreen(categoryId: categoryId);
          }
      ),
      GoRoute(path: RouteName.orderHistory,
          builder: (context, state) => const OrderHistoryScreen()
      ),
      GoRoute(path: RouteName.account,
          builder: (context, state) => const AccountScreen()
      ),
      GoRoute(path: RouteName.editPassword,
          builder: (context, state) => const EditPasswordScreen()
      ),

      GoRoute(path: RouteName.editAccountInformation,
          builder: (context, state) => const EditAccountInformationScreen()
      ),

      GoRoute(path:RouteName.orderDetail,

          builder: (context,state) {

            final order = state.extra  as OrderSuccessDto ;

            return OrderDetailScreen(order: order);
          }
      ),

      GoRoute(path:RouteName.order,

          builder: (context,state) =>  OrderScreen()
      ),
      GoRoute(path: RouteName.productDetail,
          builder: (context, state) {
            final product = state.extra as FoodDto ; // Giả sử `product` là một đối tượng
            return ProductDetailScreen(food: product,);
          }
      ),
      GoRoute(path:RouteName.bestSeller,
          builder: (context,state) => const BestSellerScreen()),

      GoRoute(path:RouteName.manageProducts,
          builder: (context,state) => const ManageProductsScreen()),

      GoRoute(path:RouteName.addProduct,
          builder: (context,state) =>AddProductScreen()),
    ]
);