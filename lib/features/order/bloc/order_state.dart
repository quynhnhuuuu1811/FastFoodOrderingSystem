part of 'order_bloc.dart';

enum OrderStatus { initial, loading, success, failure }
final class OrderState {
  final OrderStatus status;
  final String message;
  final List<OrderSuccessDto> orders;
  final List<SelectItemsDto> selectItems;
  final List<FoodDto> bestSeller;
  OrderState({
    this.status = OrderStatus.initial,
    this.message = '',
    this.orders = const [],
    this.selectItems = const [],
    this.bestSeller = const [],
  });

  OrderState copyWith({
    OrderStatus? status,
    String? message,
    List<OrderSuccessDto>? orders,
    List<SelectItemsDto>? selectItems,
    List<FoodDto>? bestSeller,
  }) {
    return OrderState(
      status: status ?? this.status,
      message: message ?? this.message,
      orders: orders ?? this.orders,
      selectItems: selectItems ?? this.selectItems,
      bestSeller: bestSeller ?? this.bestSeller,
    );
  }

}

final class OrderInitial extends OrderState {}
