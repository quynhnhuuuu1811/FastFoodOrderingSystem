part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddFoodToCart extends CartEvent {
  final int userId;
  final int foodId;
  final int quantity;

  AddFoodToCart({
    required this.userId,
    required this.foodId,
    required this.quantity,
  });
}

final class RemoveFoodFromCart extends CartEvent {
  final int userId;
  final int foodId;

  RemoveFoodFromCart({
    required this.userId,
    required this.foodId,
  });
}

final class GetCart extends CartEvent {
  final int userId;

  GetCart({
    required this.userId,
  });
}

final class UpdateCart extends CartEvent {
  final int userId;
  final int quantity;
  final int foodId;
  UpdateCart({
    required this.userId,
    required this.quantity,
    required this.foodId,
  });
}
