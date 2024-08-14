import 'package:fastfood_ordering_system/features/order/dtos/select_Items_dto.dart';

import '../../cart/dtos/cart_dto.dart';

class OrderDto{
  final String address;
  final String note;
  final List<SelectItemsDto> selectItems;

  OrderDto({
    required this.address,
    required this.selectItems,
    required this.note,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json){
    return OrderDto(
      address: json['address'],
      note: json['note'],
      selectItems: (json['selectItems'] as List).map((e) => SelectItemsDto.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'note': note,
    'selectedItems': selectItems.map((e) => e.toJson()).toList(),
  };
}