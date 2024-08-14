import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/order/dtos/order_dto.dart';

import '../../foods/dtos/food_dto.dart';
import '../dtos/order_success_dto.dart';

class OrderApiClient{
  final Dio dio;

  OrderApiClient(this.dio);


  Future<String> creatOrder(OrderDto orderDto, int userId) async{
    try{
      final response= await dio.post('/v1/orders/$userId',
        data: orderDto.toJson(),
      );
      return response.data['message'];
    }on DioException catch (e) {
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

  Future<List<OrderSuccessDto>> getOrderByUserId(int userId) async{

    try{
      final response = await dio.get('/v1/orders/$userId',

      );
      return (response.data as List).map((e) => OrderSuccessDto.fromJson(e)).toList();
    }on DioException catch (e) {
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

  Future<List<FoodDto>> getBestSeller () async{
    try{
      final response = await dio.get('/v1/orders/bestSeller',

      );
      print(response.data);
      return (response.data as List).map((e) => FoodDto.fromJsonNotCategory(e)).toList();
    }on DioException catch (e) {
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