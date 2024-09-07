import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/foods/dtos/food_request_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/food_dto.dart';

class FoodApiClient {
  final Dio dio;

  FoodApiClient({required this.dio});

  Future<List<FoodDto>> fetchFoodsByCategory(int categoryId) async {

    try {
      final response = await dio.get(
        '/v1/foods/foodTypes/$categoryId'
      );

      // Kiểm tra phản hồi và dữ liệu
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => FoodDto.fromJson(json)).toList();
      } else {
        log('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to load foods. Status code: ${response.statusCode}');
      }
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

  Future<FoodDto> addFood(FoodRequestDto food) async {
    try {
      final response = await dio.post(
        '/v1/foods',
        data: food.toJson(),
      );

      if (response.statusCode == 200) {
        return FoodDto.fromJson(response.data);
      } else {
        log('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to add food. Status code: ${response.statusCode}');
      }
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

  Future<void> deleteFood(int id) async {
    try {
      final response = await dio.delete(
        '/v1/foods/$id',
      );

      if (response.statusCode != 200) {
        log('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to delete food. Status code: ${response.statusCode}');
      }

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

  Future<FoodDto> updateFood(FoodRequestDto food) async {
    try {
      final response = await dio.put(
        '/v1/foods/${food.id}',
        data: food.toJson(),
      );

      if (response.statusCode == 200) {
        return FoodDto.fromJson(response.data);
      } else {
        log('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to update food. Status code: ${response.statusCode}');
      }
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

  Future<List<FoodDto>> fetchFoods() async {
    try {
      final response = await dio.get(
        '/v1/foods',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => FoodDto.fromJson(json)).toList();
      } else {
        log('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to load foods. Status code: ${response.statusCode}');
      }
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
