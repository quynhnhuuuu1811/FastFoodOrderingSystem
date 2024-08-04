class RefreshtokenSuccuessDto{
  late final String accessToken;
  late final String refreshToken;

  RefreshtokenSuccuessDto({required this.accessToken, required this.refreshToken});

  RefreshtokenSuccuessDto.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}