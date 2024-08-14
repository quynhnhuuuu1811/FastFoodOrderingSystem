class UserDto{
  final int id;
  final String name;
  final String phoneNumber;
  final String password;

  UserDto({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password,
  });

  UserDto.empty()
      : id = 0,
        name = '',
        phoneNumber = '',
        password = '';

  factory UserDto.fromJson(Map<String, dynamic> json){
    return UserDto(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}