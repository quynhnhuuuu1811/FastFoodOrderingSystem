part of 'count_controller_bloc.dart';

final class CountControllerState {
  final int quantity;

  const CountControllerState({this.quantity = 1});

  CountControllerState copyWith({
    int? quantity,
  }) {
    return CountControllerState(
      quantity: quantity ?? this.quantity,
    );
  }
}

final class CountControllerInitial extends CountControllerState {}
