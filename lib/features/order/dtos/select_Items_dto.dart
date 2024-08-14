class SelectItemsDto{
  final int foodId;
  final int quantity;
  final String name;
  final String image;
  final int price;

  SelectItemsDto({
    required this.foodId,
    required this.quantity,
    this.name='',
    this.image='',
    this.price=0,
  });

  factory SelectItemsDto.fromJson(Map<String, dynamic> json){
    return SelectItemsDto(
      foodId: json['foodId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'foodId': foodId,
    'quantity': quantity,
  };
}