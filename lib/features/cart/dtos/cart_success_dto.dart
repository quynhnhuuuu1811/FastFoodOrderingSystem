import 'food_for_cart_dto.dart';

class CartSuccessDto{
  final int id;
  final int userId;
  final List<FoodForCartDto> foodForCartDto;

  CartSuccessDto({
    required this.id,
    required this.userId,
    required this.foodForCartDto,
  });

  CartSuccessDto.empty({
   this.id=0,
     this.userId=0,
      this.foodForCartDto = const [],
  });

  factory CartSuccessDto.fromJson(Map<String, dynamic> json) {
    List<FoodForCartDto> foodForCartDto = [];
    print(json);
    if (json['Food'] != null) {
      // Assuming `foodForCartDto` is a list of maps in the JSON
      foodForCartDto = List<FoodForCartDto>.from(
          json['Food'].map((item) => FoodForCartDto.fromJson(item))
      );
    }
    print(foodForCartDto);
    return CartSuccessDto(
      id: json['id'],
      userId: json['UserId'],
      foodForCartDto: foodForCartDto,
    );
  }

}