import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_dto.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/login_success_dto.dart';

class AuthApiClient{
  final Dio dio;

  AuthApiClient(this.dio);

  Future<LoginSuccessDto> login(LoginDto loginDto) async {
    try {
      final response = await dio.post(
        '/auth/v1/login',
        data: {
          'phoneNumber': loginDto.phoneNumber,
          'password': loginDto.password,
        },
      );
      return LoginSuccessDto.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
      } else {
        print('Dio error! Message: ${e.message}');
      }
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }
}