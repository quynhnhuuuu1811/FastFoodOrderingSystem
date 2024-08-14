import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/auth/dtos/refreshToken_succuess_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor(this.dio, this.sharedPreferences);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401|| err.response?.statusCode == 403) {
      if (_isRefreshing) {
        // Nếu đang trong quá trình làm mới token, chờ đợi cho đến khi hoàn tất
        await _refreshCompleter?.future;
        return _retryRequest(err, handler);
      }

      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      final refreshToken = sharedPreferences.getString('refreshToken');
      if (refreshToken == null) {
        // Không có refreshToken, không thể làm mới
        _isRefreshing = false;
        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: 'Refresh token is missing',
        ));
      }

      try {
        final response = await dio.post('/v1/auth/refresh', data: {
          'refreshToken': refreshToken,
        });

        final refreshTokenSuccessDto = RefreshtokenSuccuessDto.fromJson(response.data);
        await sharedPreferences.setString('accessToken', refreshTokenSuccessDto.accessToken);
        await sharedPreferences.setString('refreshToken', refreshTokenSuccessDto.refreshToken);

        // Cập nhật accessToken mới cho Dio
        dio.options.headers['token'] = 'Bearer ${refreshTokenSuccessDto.accessToken}';

        _refreshCompleter?.complete();
      } catch (e) {
        _refreshCompleter?.completeError(e);
        // Xử lý lỗi khi làm mới token thất bại
        _isRefreshing = false;
        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: 'Token refresh failed: $e',
        ));
      } finally {
        _isRefreshing = false;
        _refreshCompleter = null;
      }

      // Thử lại request gốc với token mới
      return _retryRequest(err, handler);
    }

    // Nếu lỗi không phải 401, chuyển tiếp lỗi đến handler
    return handler.next(err);
  }

  Future<void> _retryRequest(DioException err, ErrorInterceptorHandler handler) async {
    final opts = Options(
      method: err.requestOptions.method,
      headers: {
        ...err.requestOptions.headers,
        'token': dio.options.headers['token'],
      },
    );

    try {
      final response = await dio.request(
        err.requestOptions.path,
        options: opts,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );

      handler.resolve(response);
    } catch (e) {
      handler.reject(e as DioException);
    }
  }
}
