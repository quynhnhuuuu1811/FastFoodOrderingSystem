class LoginSuccessDto{
  late final String accsessToken;
  late final String refreshToken;

  LoginSuccessDto({required this.accsessToken, required this.refreshToken});

  LoginSuccessDto.fromJson(Map<String, dynamic> json){
    accsessToken = json['accsessToken'];
    refreshToken = json['refreshToken'];
  }
}