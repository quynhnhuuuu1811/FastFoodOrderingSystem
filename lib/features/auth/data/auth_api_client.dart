import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_dto.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_success_dto.dart';

class AuthApiClient {
  final Dio dio;

  AuthApiClient(this.dio);

  Future<LoginSuccessDto> login(LoginDto loginDto) async {
    try {

      final response = await dio.post(
        '/v1/auth/login',
        data: {
          'phoneNumber': loginDto.phoneNumber,
          'password': loginDto.password,
        },
      );

      return LoginSuccessDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioException: ${e.message}');
        log('Response data: ${e.response!.data}');
        throw Exception(e.response!.data['message'] ?? 'Unknown error');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      log('Unknown exception: $e');
      throw Exception('Unknown error occurred');
    }
  }
}


