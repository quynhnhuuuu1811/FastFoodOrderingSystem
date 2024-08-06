part of 'auth_bloc.dart';

enum AuthStatus { initial,loading, success, failed }

final class AuthState {
  late final AuthStatus status;
  late final String? message;
  late final String refreshToken;
  AuthState({
    this.status = AuthStatus.initial,
   this.message='',
    this.refreshToken='',
  });

  AuthState copyWith({
    String? refreshToken,
    AuthStatus? status,
    String? errorMsg,
  }) {
    return AuthState(
      refreshToken: refreshToken ?? this.refreshToken,
      message: errorMsg ?? this.message,
      status: status ?? this.status,
    );
  }
}
final class AuthInitial extends AuthState {
}



