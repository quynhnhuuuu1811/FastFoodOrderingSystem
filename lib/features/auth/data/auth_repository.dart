
import 'package:fastfood_ordering_system/features/auth/data/auth_api_client.dart';
import 'dart:developer';
import '../../result_type.dart';
import '../dtos/login_dto.dart';
import 'auth_local_data_source.dart';

class AuthRepository{
  final AuthApiClient authApiClient;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({
    required this.authApiClient,
    required this.authLocalDataSource
  });

  Future<Result<bool>> login({
    required String phoneNumber,
    required String password
  }) async {
    try {
      final loginSuccessDto = await authApiClient.login(LoginDto(
          phoneNumber: phoneNumber,
          password: password
      ));

      await authLocalDataSource.saveToken(loginSuccessDto.accsessToken, loginSuccessDto.refreshToken);
      return Success(true);
    } catch (e) {
     log('Error AuthRepo: $e');
      return Failed(e.toString());
    }

  }
}