
class CartFoodDto{
  final int quantity;

  CartFoodDto({
    required this.quantity,
  });


  factory CartFoodDto.fromJson(Map<String, dynamic> json){
    return CartFoodDto(
      quantity: json['quantity'],
    );
  }
}