import 'package:fastfood_ordering_system/features/foods/data/food_api_client.dart';

import '../dtos/food_dto.dart';

class FoodRepository{
  final FoodApiClient foodApiClient;
  FoodRepository({required this.foodApiClient});

  Future<List<FoodDto>> fetchFoodsByCategory(int categoryId) async{
    return foodApiClient.fetchFoodsByCategory(categoryId);
  }
}