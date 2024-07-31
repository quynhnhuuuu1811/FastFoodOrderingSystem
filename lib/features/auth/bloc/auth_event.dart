part of 'auth_bloc.dart';


class AuthEvent {}

class AuthLoginStarted extends AuthEvent {
  final String phoneNumber;
  final String password;

  AuthLoginStarted(this.phoneNumber, this.password);
}
class AuthRegisterStarted extends AuthEvent {
}