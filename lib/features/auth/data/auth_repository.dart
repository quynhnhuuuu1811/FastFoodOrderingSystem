
import 'package:fastfood_ordering_system/features/auth/data/auth_api_client.dart';
import 'dart:developer';
import '../../result_type.dart';
import '../dtos/login_dto.dart';
import '../dtos/register_dto.dart';
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

      await authLocalDataSource.saveToken(loginSuccessDto.accessToken, loginSuccessDto.refreshToken);
      return Success(true);
    } catch (e) {
      final errorMessage = e.toString().replaceAll(RegExp(r'Exception: '), '');
      log('Error AuthRepo: $errorMessage');
      return Failed(errorMessage);
    }
  }

  Future<Result<bool>> register({
    required String phoneNumber,
    required String password,
    required String name
}) async{
    try{
       await authApiClient.register(RegisterDto(
          phoneNumber: phoneNumber,
          password: password,
          name: name
      ));
      return Success(true);
    } catch(e){
      final errorMessage = e.toString().replaceAll(RegExp(r'Exception: '), '');
      log('Error AuthRepo: $errorMessage');
      return Failed(errorMessage);
    }
  }

  Future<Result<bool>> logout() async {
    try {
      await authLocalDataSource.deleteToken();
      return Success(true);
    } catch (e) {
      final errorMessage = e.toString().replaceAll(RegExp(r'Exception: '), '');
      log('Error AuthRepo: $errorMessage');
      return Failed(errorMessage);
    }
  }

}