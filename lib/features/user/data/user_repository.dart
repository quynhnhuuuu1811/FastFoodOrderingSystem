import 'package:fastfood_ordering_system/features/user/data/user_api_client.dart';

import '../dtos/user_dto.dart';

class UserRepository{
  final UserApiClient userApiClient;
  UserRepository({required this.userApiClient});

  Future<UserDto> fetchUser(String id) async {
    return userApiClient.getUser(id);
  }
}