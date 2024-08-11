import 'dart:developer';

import 'package:dio/dio.dart';

import '../dtos/user_dto.dart';

class UserApiClient{
  final Dio dio;
  UserApiClient({required this.dio});

  Future<UserDto> getUser(String id) async {
    try{
      print("Id:$id");
      final response = await dio.get('/v1/users/$id');
      print("Response: $response");
      return UserDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioException: ${e.message}');
        log('Response data: ${e.response!.data}');
        throw Exception(e.response!.data['message'] ?? 'Unknown error');
      } else {
        log('DioException without response: ${e.message}');
        throw Exception(e.message);
      }
    }
    catch (e) {
      log('Unknown exception: $e');
      throw Exception('Unknown error occurred');
    }

  }

}

