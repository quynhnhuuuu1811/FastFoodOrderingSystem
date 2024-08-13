part of 'count_controller_bloc.dart';

@immutable
sealed class CountControllerEvent {}

final class Increment extends CountControllerEvent {}

final class Decrement extends CountControllerEvent {}

final class Reset extends CountControllerEvent {}
