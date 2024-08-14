import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/category/dtos/category_dto.dart';

class CategoryApiClient {
  final Dio dio;
  CategoryApiClient({required this.dio});

  Future<List<CategoryDto>> getCategories() async {
    try {
      final response = await dio.get('/v1/foodTypes');
      // Đảm bảo response.data là một List
      if (response.data is List) {
        return (response.data as List)
            .map((e) => CategoryDto.fromJson(e))
            .toList();
      } else {
        throw Exception('Unexpected data format');
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

