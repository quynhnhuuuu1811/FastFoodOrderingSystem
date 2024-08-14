part of 'order_bloc.dart';

enum OrderStatus { initial, loading, success, failure }
final class OrderState {
  final OrderStatus status;
  final String message;
  final List<OrderSuccessDto> orders;
  final List<SelectItemsDto> selectItems;

  OrderState({
    this.status = OrderStatus.initial,
    this.message = '',
    this.orders = const [],
    this.selectItems = const [],
  });

  OrderState copyWith({
    OrderStatus? status,
    String? message,
    List<OrderSuccessDto>? orders,
    List<SelectItemsDto>? selectItems,
  }) {
    return OrderState(
      status: status ?? this.status,
      message: message ?? this.message,
      orders: orders ?? this.orders,
      selectItems: selectItems ?? this.selectItems,
    );
  }

}

final class OrderInitial extends OrderState {}
