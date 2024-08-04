class RegisterDto{
  final String phoneNumber;
  final String password;
  final String name;

  RegisterDto({required this.phoneNumber, required this.password, required this.name});

  Map<String,dynamic> toJson() => {
    'phoneNumber': phoneNumber,
    'password': password,
    'name': name
  };

}