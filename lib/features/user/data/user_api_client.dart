import 'dart:developer';

import 'package:dio/dio.dart';

import '../dtos/user_dto.dart';

class UserApiClient{
  final Dio dio;
  UserApiClient({required this.dio});

  Future<UserDto> getUser(String id) async {
    try{

      final response = await dio.get('/v1/users/$id');

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

  Future<UserDto> updateUserInfor(UserDto userDto) async {
    try{
      final response = await dio.patch(
          '/v1/users/${userDto.id}',
          data: {
            'name': userDto.name,
            'phone': userDto.phoneNumber,
          }
      );
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

  Future<UserDto>updatePassword(UserDto userDto,String oldPass) async {
    try{
      final response = await dio.patch(
          '/v1/users/${userDto.id}',
          data: {
            'newPass': userDto.password,
            'oldPass':oldPass ,
          }
      );
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

