import 'package:fastfood_ordering_system/config/http_client.dart';
import 'package:fastfood_ordering_system/features/auth/data/network/auth_interceptor.dart';
import 'package:fastfood_ordering_system/features/cart/bloc/cart_bloc.dart';
import 'package:fastfood_ordering_system/features/cart/data/cart_api_client.dart';
import 'package:fastfood_ordering_system/features/countController/bloc/count_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/data/auth_api_client.dart';
import 'features/auth/data/auth_local_data_source.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/cart/data/cart_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sf = await SharedPreferences.getInstance();
  runApp(MyApp(sf: sf));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.sf}) : super(key: key);
  final SharedPreferences sf;

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          // Thêm các Bloc khác nếu cần
          BlocProvider(
            create: (context) => CartBloc(context.read<CartRepository>()),
          ),
          BlocProvider(
            create: (context) => CountControllerBloc(context.read<CartRepository>()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
