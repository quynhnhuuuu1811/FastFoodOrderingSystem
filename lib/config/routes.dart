
import 'package:fastfood_ordering_system/screen/categoryPage/CategoryScreen.dart';
import 'package:fastfood_ordering_system/screen/introPage/IntroScreen.dart';
import 'package:fastfood_ordering_system/screen/listProductPage/listProductScreen.dart';
import 'package:fastfood_ordering_system/screen/signUpPage/signUpScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/bloc/auth_bloc.dart';
import '../screen/EditAccountInformationPage/EditAccountInformationScreen.dart';
import '../screen/accountPage/AccountScreen.dart';
import '../screen/cartpage/CartScreen.dart';
import '../screen/editPasswordPage/EditPasswordScreen.dart';
import '../screen/homepage/HomePageScreen.dart';
import '../screen/orderHistoryPage/OrderHistoryScreen.dart';
import '../screen/signInPage/signInScreen.dart';

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

  static const publicRoutes = [
    login,
    register,
    intro
  ];
}

final router =GoRouter(
    initialLocation: RouteName.intro, // Set the initial location to intro
    // redirect: (context, state) {
    //   // If the user is navigating to a public route or is authenticated, allow the navigation
    //   if (RouteName.publicRoutes.contains(state.fullPath) || context.read<AuthBloc>().state.status == AuthStatus.success) {
    //     return null;
    //   }
    //   // Otherwise, redirect to the login page
    //   return RouteName.login;
    // },
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
          builder: (context, state) => const listProductScreen()
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


    ]
);