import 'package:fastfood_ordering_system/features/order/data/order_api_client.dart';
import 'package:fastfood_ordering_system/features/order/dtos/order_dto.dart';
import 'package:fastfood_ordering_system/features/order/dtos/order_success_dto.dart';

import '../../foods/dtos/food_dto.dart';
import '../dtos/select_Items_dto.dart';

class OrderRepository{
  final OrderApiClient orderApiClient;

  OrderRepository(this.orderApiClient);

  Future<String> createOrder(
      {required String address,
        required String note,
      required List<SelectItemsDto> selectItems,
      required int userId}) async{
    return await orderApiClient.creatOrder(OrderDto(address: address,note: note, selectItems: selectItems), userId);
  }

  Future<List<OrderSuccessDto>> getOrderByUserId(int userId) async{
    return await orderApiClient.getOrderByUserId(userId);
  }

  Future<List<FoodDto>> getBestSeller() async{
    return await orderApiClient.getBestSeller();
  }
}