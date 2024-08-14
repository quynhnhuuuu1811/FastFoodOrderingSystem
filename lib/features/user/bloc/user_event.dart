part of 'user_bloc.dart';


sealed class UserEvent {}


final class FetchUser extends UserEvent {
  final String id;
  FetchUser(this.id);
}

final class UpdateUserInfor extends UserEvent {
  final int id;
  final String name;
  final String phone;
  UpdateUserInfor(this.id, this.name, this.phone);
}

final class UpdatePassword extends UserEvent {
  final int id;
  final String password;
  final String oldPass;
  UpdatePassword(this.id,this.password,this.oldPass);
}