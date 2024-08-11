class FoodDto{
  final String name;
  final double price;
  final String image;

  FoodDto({
    required this.name,
    required this.price,
    required this.image,
  });

  factory FoodDto.fromJson(Map<String, dynamic> json){
    return FoodDto(
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}