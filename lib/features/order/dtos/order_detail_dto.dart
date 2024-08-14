class OrderDetailDto{
  final int quantity;

  OrderDetailDto({
    required this.quantity,
  });

  factory OrderDetailDto.fromJson(Map<String, dynamic> json){
    return OrderDetailDto(
      quantity: json['quantity'],
    );
  }
}