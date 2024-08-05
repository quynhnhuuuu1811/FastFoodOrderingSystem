import 'dart:ffi';

class CategoryDto{
  late final Int id;
  late final String name;
  late final String image;

  CategoryDto({required this.id, required this.name, required this.image});

  CategoryDto.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }


}