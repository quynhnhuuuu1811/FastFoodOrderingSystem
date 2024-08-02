part of 'auth_bloc.dart';


class AuthEvent {}
class AuthStarted extends AuthEvent {}
class AuthLoginStarted extends AuthEvent {
  final String phoneNumber;
  final String password;

  AuthLoginStarted(this.phoneNumber, this.password);
}
class AuthRegisterStarted extends AuthEvent {
}
class AuthLogoutStarted extends AuthEvent {
}
class AuthAuthenticateStarted extends AuthEvent {
}