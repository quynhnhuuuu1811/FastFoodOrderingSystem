class LoginSuccessDto{
  late final String accessToken;
  late final String refreshToken;
  late final String expriedTime;
  LoginSuccessDto({required this.accessToken, required this.refreshToken});

  LoginSuccessDto.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}