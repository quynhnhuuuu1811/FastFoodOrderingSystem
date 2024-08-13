import 'cart_food_dto.dart';

class FoodForCartDto{
  final int id;
  final String name;
  final int price;
  final String image;
  final CartFoodDto cartFoodDto;
  FoodForCartDto({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.cartFoodDto,
  });

  factory FoodForCartDto.fromJson(Map<String, dynamic> json){

    return FoodForCartDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
     cartFoodDto: CartFoodDto.fromJson(json['CartFood']),
    );
  }


}