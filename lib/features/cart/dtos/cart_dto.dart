class CartDto{
final int carId;
  final int userId;
  final int foodId;
  final int quantity;

  CartDto({
    this.carId=-1,
    required this.foodId,
    required this.quantity,
    this.userId=-1,
  });

  Map<String, dynamic> toJson() => {
    'foodId': foodId,
    'quantity': quantity,
  };
}