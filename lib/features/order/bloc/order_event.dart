part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

final class OrderCreate extends OrderEvent {
  final String address;

  final List<SelectItemsDto> selectItems;
  final int userId;
  final String note;

  OrderCreate({
    required this.address,

    required this.selectItems,
    required this.userId,
    required this.note,
  });
}

final class UpdateSelectItems extends OrderEvent {
  final List<SelectItemsDto> selectItems;

  UpdateSelectItems({
    required this.selectItems,
  });
}