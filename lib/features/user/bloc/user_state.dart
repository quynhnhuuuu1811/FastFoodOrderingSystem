part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }
final class UserState {
  late final UserStatus status;
  late final UserDto user;
  late final String message;

  UserState({
    this.status = UserStatus.initial,
    UserDto? user, // Sử dụng UserDto? để có thể cung cấp giá trị null
    this.message = "",
  }) : user = user ?? UserDto.empty();

  UserState copyWith({
    UserStatus? status,
    UserDto? user,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }
}

final class UserInitial extends UserState {}
