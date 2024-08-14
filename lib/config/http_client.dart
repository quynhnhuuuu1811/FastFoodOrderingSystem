import 'package:dio/dio.dart';

final dio =Dio(
  BaseOptions(
    baseUrl: 'http://192.168.100.185:3000/',

    // baseUrl: 'http://192.168.10.172:3000/',
  ),
);
