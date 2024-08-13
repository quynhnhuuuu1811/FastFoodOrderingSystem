import '../../category/dtos/category_dto.dart';

class FoodDto{
  final int id;
  final String name;
  final int price;
  final String image;
  final CategoryDto category;
  FoodDto({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  factory FoodDto.fromJson(Map<String, dynamic> json){
    return FoodDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      category: CategoryDto.fromJson(json['FoodType']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'FoodType': category,
    };
  }
}