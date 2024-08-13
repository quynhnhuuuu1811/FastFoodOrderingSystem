class CartDto{
  final int userId;
  final int foodId;
  final int quantity;

  CartDto({
    required this.foodId,
    required this.quantity,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
    'foodId': foodId,
    'quantity': quantity,
  };
}