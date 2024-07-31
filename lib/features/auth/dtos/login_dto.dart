class LoginDto{
  final String phoneNumber;
  final String password;

  LoginDto({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() => {
    'phoneNumber': phoneNumber ,
    'password': password
  };
}