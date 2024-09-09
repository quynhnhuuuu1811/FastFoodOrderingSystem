import 'package:fastfood_ordering_system/features/foods/data/food_api_client.dart';
import 'package:fastfood_ordering_system/features/foods/dtos/food_request_dto.dart';

import '../dtos/food_dto.dart';

class FoodRepository{
  final FoodApiClient foodApiClient;
  FoodRepository({required this.foodApiClient});

  Future<List<FoodDto>> fetchFoodsByCategory(int categoryId) async{
    return foodApiClient.fetchFoodsByCategory(categoryId);
  }

  Future<FoodDto> addFood(String name,int price,String image,int category) async{
    return foodApiClient.addFood(FoodRequestDto(name: name, price: price, image: image, category: category));
  }

  Future<void> deleteFood(int id) async{
    return foodApiClient.deleteFood(id);
  }

  Future<FoodDto> updateFood(int id, String name,int price,String image,int category) async{
    return foodApiClient.updateFood(FoodRequestDto(id:id,name: name, price: price, image: image, category: category));
  }

  Future<List<FoodDto>> fetchFoodAllFood() async{
    return foodApiClient.fetchFoods();
  }
}