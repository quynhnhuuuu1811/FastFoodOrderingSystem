import 'package:fastfood_ordering_system/config/http_client.dart';
import 'package:fastfood_ordering_system/features/auth/data/network/auth_interceptor.dart';
import 'package:fastfood_ordering_system/features/cart/bloc/cart_bloc.dart';
import 'package:fastfood_ordering_system/features/cart/data/cart_api_client.dart';
import 'package:fastfood_ordering_system/features/countController/bloc/count_controller_bloc.dart';
import 'package:fastfood_ordering_system/features/foods/data/food_api_client.dart';
import 'package:fastfood_ordering_system/features/order/data/order_api_client.dart';
import 'package:fastfood_ordering_system/features/user/data/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/data/auth_api_client.dart';
import 'features/auth/data/auth_local_data_source.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/cart/data/cart_repository.dart';
import 'features/foods/bloc/food_bloc.dart';
import 'features/foods/data/food_repository.dart';
import 'features/order/bloc/order_bloc.dart';
import 'features/order/data/order_repository.dart';
import 'features/user/bloc/user_bloc.dart';
import 'features/user/data/user_api_client.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sf = await SharedPreferences.getInstance();
  final accessToken = sf.getString('accessToken');
  // Xác định đường dẫn ban đầu
  String initialRoute = accessToken != null ? RouteName.home : RouteName.intro;

  runApp(MyApp(sf: sf, initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.sf, required this.initialRoute}) : super(key: key);
  final SharedPreferences sf;
  final String initialRoute; // Thêm biến để lưu đường dẫn ban đầu

  @override
  Widget build(BuildContext context) {
    dio.interceptors.add(AuthInterceptor(dio, sf));
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authApiClient: AuthApiClient(dio),
            authLocalDataSource: AuthLocalDataSource(sf),
          ),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(
            cartApiClient: CartApiClient(dio),
          ),
        ),
        RepositoryProvider(
          create: (context) => OrderRepository(
            OrderApiClient(dio),
          ),
        ),
        RepositoryProvider(
          create: (context) => FoodRepository(
            foodApiClient: FoodApiClient(dio: dio),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            userApiClient: UserApiClient(dio: dio),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => CartBloc(context.read<CartRepository>()),
          ),
          BlocProvider(
            create: (context) => CountControllerBloc(context.read<CartRepository>()),
          ),
          BlocProvider(
            create: (context) => OrderBloc(context.read<OrderRepository>()),
          ),
          BlocProvider(
            create: (context) => FoodBloc(context.read<FoodRepository>()),
          ),
          BlocProvider(
            create: (context) => FoodBloc(context.read<FoodRepository>()),
          ),
          BlocProvider(
            create: (context) => UserBloc(context.read<UserRepository>()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router(initialRoute), // Sử dụng `initialRoute` để cấu hình router
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

