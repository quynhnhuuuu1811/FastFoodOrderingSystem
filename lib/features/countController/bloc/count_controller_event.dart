part of 'count_controller_bloc.dart';

@immutable
sealed class CountControllerEvent {}

final class Increment extends CountControllerEvent {
  final int foodId;
  Increment(this.foodId);
}

final class Decrement extends CountControllerEvent {
  final int foodId;
  Decrement(this.foodId);
}

final class Reset extends CountControllerEvent {

}

final class SetQuantity extends CountControllerEvent {
  final int quantity;
  final int foodId;
  SetQuantity(this.quantity, this.foodId);
}

final class IncrementUpdateQuantityCart extends CountControllerEvent {
  final int foodId;
  final int userId;
  IncrementUpdateQuantityCart(this.userId,this.foodId);
}

final class DecrementUpdateQuantityCart extends CountControllerEvent {
  final int foodId;
  final int userId;

  DecrementUpdateQuantityCart(this.userId,this.foodId);
}