import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_dto.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_success_dto.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/register_dto.dart';

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
        log('DioException without response: ${e.message}');
        throw Exception(e.message);
      }
    } catch (e) {
      log('Unknown exception: $e');
      throw Exception('Unknown error occurred');
    }
  }

  Future<void> register(RegisterDto registerDto) async {
    try {
      await dio.post(
        '/v1/auth/register',
        data: {
          'phoneNumber': registerDto.phoneNumber,
          'password': registerDto.password,
          'name': registerDto.name,
        },
      );
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioException: ${e.message}');
        log('Response data: ${e.response!.data}');
        throw Exception(e.response!.data['message'] ?? 'Unknown error');
      } else {
        log('DioException without response: ${e.message}');
        throw Exception(e.message);
      }
    } catch (e) {
      log('Unknown exception: $e');
      throw Exception('Unknown error occurred');
    }
  }
}
