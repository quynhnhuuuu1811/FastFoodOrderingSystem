import 'dart:developer';
import 'package:dio/dio.dart';
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
}
