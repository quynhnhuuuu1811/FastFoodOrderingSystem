part of 'user_bloc.dart';


sealed class UserEvent {}


final class FetchUser extends UserEvent {
  final String id;
  FetchUser(this.id);
}