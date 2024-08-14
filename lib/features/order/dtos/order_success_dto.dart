class OrderSuccessDto{
 final int id;
 final int total;
  final String status;
  final String address;
  final String phoneNumber;
  final int userId;

  OrderSuccessDto({
    required this.id,
    required this.total,
    required this.status,
    required this.address,
    required this.phoneNumber,
    required this.userId,
  });

  factory OrderSuccessDto.fromJson(Map<String, dynamic> json){
    return OrderSuccessDto(
      id: json['id'],
      total: json['total'],
      status: json['status'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
    );
  }
}