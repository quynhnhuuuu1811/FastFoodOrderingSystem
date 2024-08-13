import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastfood_ordering_system/features/cart/dtos/cart_dto.dart';
import '../dtos/cart_success_dto.dart';

class CartApiClient{
  final Dio dio;

  CartApiClient( this.dio);

  Future<String> addFoodToCart(CartDto cart) async{

   try{
     final response= await dio.post('/v1/carts/${cart.userId}',
       data: {
         'foodId': cart.foodId,
         'quantity': cart.quantity,
       },
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

  Future<CartSuccessDto> getCartByUserId(int userId) async{

    try{
      final response = await dio.get('/v1/carts/$userId',

      );
      return CartSuccessDto.fromJson(response.data);
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

  Future<String> updateCart(CartDto cart) async{

    try{
      final response = await dio.put('/v1/carts/${cart.userId}',
        data: {
          'foodId': cart.foodId,
          'quantity': cart.quantity,
        },

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

}