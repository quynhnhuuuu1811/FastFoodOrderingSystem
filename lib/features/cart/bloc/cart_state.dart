part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }
final class CartState {
  final CartStatus status;
  final CartSuccessDto cartSuccessDto;
  final String message;

  CartState({
     this.status = CartStatus.initial,
     CartSuccessDto? cartSuccessDto,
    this.message="",
  }):cartSuccessDto = cartSuccessDto ?? CartSuccessDto.empty();

  CartState copyWith({
    CartStatus? status,
    CartSuccessDto? cartSuccessDto,
    String? message,
  }) {
    return CartState(
      status: status ?? this.status,
      cartSuccessDto: cartSuccessDto ?? this.cartSuccessDto,
      message: message ?? this.message,
    );
  }
}

final class CartInitial extends CartState {}
