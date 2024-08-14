import 'package:fastfood_ordering_system/features/cart/dtos/cart_dto.dart';

import '../dtos/cart_success_dto.dart';
import 'cart_api_client.dart';

class CartRepository{
  final CartApiClient cartApiClient;

  CartRepository({required this.cartApiClient});

  Future<String> addFoodToCart(int userId, int foodId,int quantity) async{
    return await cartApiClient.addFoodToCart(CartDto(foodId: foodId, quantity: quantity, userId: userId));
  }

  Future<CartSuccessDto> getCart(int userId) async{
    return await cartApiClient.getCartByUserId(userId);
  }

  Future<String> removeFoodFromCart(int cartId, int foodId) async{
    return await cartApiClient.removeFoodFromCart(cartId, foodId);
  }

  Future<String> updateCart(int userId, int quantity,int foodId) async{
    return await cartApiClient.updateCart(CartDto(foodId: foodId, quantity: quantity, userId: userId));
  }


}