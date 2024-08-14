import 'package:fastfood_ordering_system/features/user/data/user_api_client.dart';

import '../dtos/user_dto.dart';

class UserRepository{
  final UserApiClient userApiClient;
  UserRepository({required this.userApiClient});

  Future<UserDto> fetchUser(String id) async {
    return userApiClient.getUser(id);
  }

  Future<UserDto> updateUserInfor(int id,String name ,String phone) async {
    return userApiClient.updateUserInfor(UserDto(id:id,name: name, phoneNumber: phone));
  }

  Future<UserDto> updatePassword(int id,String password,String oldPass) async {
    return userApiClient.updatePassword(UserDto(id:id,password: password,),oldPass);
  }
}