class UserDto{
  final int id;
  final String name;
  final String phoneNumber;
  final String password;

  UserDto({
     this.id=0,
    this.name="",
    this.phoneNumber="",
     this.password="",
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