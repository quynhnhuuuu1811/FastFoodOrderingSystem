import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../dtos/refreshToken_succuess_dto.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  AuthInterceptor(this.dio, this.sharedPreferences);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Unauthorized, try to refresh the token
      final refreshToken = sharedPreferences.getString('refreshToken');
      if (refreshToken != null) {
        try {
          final response = await dio.post('/v1/auth/refresh', data: {
            'refreshToken': refreshToken,
          });

          final refreshTokenSuccessDto = RefreshtokenSuccuessDto.fromJson(response.data);
          await sharedPreferences.setString('accessToken', refreshTokenSuccessDto.accessToken);
          await sharedPreferences.setString('refreshToken', refreshTokenSuccessDto.refreshToken);

          // Update the authorization header
          dio.options.headers['Authorization'] = 'Bearer ${refreshTokenSuccessDto.accessToken}';

          // Retry the request with the new token
          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );

          final cloneReq = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq);
        } catch (e) {
          // If refreshing the token fails, log out the user or prompt re-authentication
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: 'Token refresh failed: $e',
          ));
        }
      }
    }

    return handler.next(err);
  }

}
