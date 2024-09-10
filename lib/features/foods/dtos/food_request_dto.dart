import '../../category/dtos/category_dto.dart';

class FoodRequestDto {
  final int? id;
  final String name;
  final int price;
  final String image;
  final int category;

  FoodRequestDto({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  factory FoodRequestDto.fromJson(Map<String, dynamic> json) {
    return FoodRequestDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      category: json['FoodType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'FoodTypeId': category,
    };
  }
}
