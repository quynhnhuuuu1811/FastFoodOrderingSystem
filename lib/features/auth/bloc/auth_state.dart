part of 'auth_bloc.dart';

enum AuthStatus { initial,loading, success, failed }

final class AuthState {
  late final AuthStatus status;
  late final String? message;
  AuthState({
    this.status = AuthStatus.initial,
   this.message,
  });

  AuthState copyWith({
    String? email,
    String? username,
    String? password,
    String? confirmPassword,
    AuthStatus? status,
    String? errorMsg,
  }) {
    return AuthState(
      message: errorMsg ?? this.message,
      status: status ?? this.status,
    );
  }
}
final class AuthInitial extends AuthState {
}

final class AuthLogoutSuccess extends AuthState {
}

