import 'package:fastfood_ordering_system/config/http_client.dart';
import 'package:fastfood_ordering_system/screen/introPage/IntroScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/data/auth_api_client.dart';
import 'features/auth/data/auth_local_data_source.dart';
import 'features/auth/data/auth_repository.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sf= await SharedPreferences.getInstance();
  runApp(MyApp(sf: sf,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.sf}) : super(key: key);
  final SharedPreferences sf;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
        authApiClient: AuthApiClient(dio),
        authLocalDataSource: AuthLocalDataSource(sf),
      ),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroScreen(), // Sử dụng tên lớp chính xác cho màn hình giới thiệu
        ),
      ),
    );
  }
}
