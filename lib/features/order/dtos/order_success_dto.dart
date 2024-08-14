import 'food_for_order_dto.dart';

class OrderSuccessDto{
 final int id;
 final int total;
  final String status;
  final String address;
  final String note;
  final int userId;
  final List<FoodForOrderDto> foodForOrderDto;
  OrderSuccessDto({
    required this.id,
    required this.total,
    required this.status,
    required this.address,
    required this.note,
    required this.userId,
    required this.foodForOrderDto,
  });

  factory OrderSuccessDto.fromJson(Map<String, dynamic> json){
    return OrderSuccessDto(
      id: json['id'],
      total: json['total'],
      status: json['status'],
      address: json['address'],
      note: json['note'],
      userId: json['UserId'],
      foodForOrderDto: (json['Food'] as List).map((e) => FoodForOrderDto.fromJson(e)).toList(),
    );
  }
}