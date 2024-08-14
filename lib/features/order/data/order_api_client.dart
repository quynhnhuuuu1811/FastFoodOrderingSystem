import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/order/dtos/order_dto.dart';

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

  Future<OrderSuccessDto> getOrderByUserId(int userId) async{

    try{
      final response = await dio.get('/v1/orders/$userId',

      );
      return OrderSuccessDto.fromJson(response.data);
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