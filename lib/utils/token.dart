import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String getUserIdFromToken(String token) {
  try {
    // Giải mã token
    final jwt = JWT.decode(token);
    // Lấy ID từ payload
    final userId = jwt.payload['id'];
    return userId.toString();
  } catch (e) {
    print('Failed to decode JWT: $e');
    return '';
  }
}

bool getRoleFromToken(String token) {
  try {
    // Giải mã token
    final jwt = JWT.decode(token);
    // Lấy role từ payload
    final role = jwt.payload['admin'];
    return role;
  } catch (e) {
    print('Failed to decode JWT: $e');
    return false;
  }
}