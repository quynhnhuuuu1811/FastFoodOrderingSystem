import 'order_detail_dto.dart';

class FoodForOrderDto{
  final int id;
  final String name;
  final int price;
  final String image;
  final OrderDetailDto orderDetailDto;
  FoodForOrderDto({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.orderDetailDto,
  });

  factory FoodForOrderDto.fromJson(Map<String, dynamic> json){
    return FoodForOrderDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      orderDetailDto: OrderDetailDto.fromJson(json['OrderDetail']),
    );
  }
}