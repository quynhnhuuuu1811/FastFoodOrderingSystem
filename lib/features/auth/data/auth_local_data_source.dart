import 'package:fastfood_ordering_system/features/auth/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource{
  final SharedPreferences sf;

  AuthLocalDataSource(this.sf);


  Future<void> saveToken(String accessToken, String refreshToken) async {
    await sf.setString( AuthDataConstants.refreshToken,  refreshToken);
    print('refreshToken: $refreshToken');
    await sf.setString(AuthDataConstants.accessToken,  accessToken);
    print('accessToken: $accessToken');
  }

  Future<String?> getAccessToken() async {
    return await sf.getString(AuthDataConstants.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await sf.getString(AuthDataConstants.refreshToken);
  }

  Future<void> deleteToken() async {
    await sf.remove(AuthDataConstants.accessToken);
    await sf.remove(AuthDataConstants.refreshToken);
  }
}