part of 'auth_bloc.dart';

enum AuthStatus { initial,loading, success, failed }

final class AuthState {
  late final AuthStatus status;

  AuthState({
    this.status = AuthStatus.initial,
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
      status: status ?? this.status,
    );
  }
}
final class AuthInitial extends AuthState {
}



