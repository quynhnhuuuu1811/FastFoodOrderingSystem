part of 'count_controller_bloc.dart';

final class CountControllerState {
  final Map<int, int> quantityMap; // Map foodId to quantity
  CountControllerState({ this.quantityMap=const {} });

  CountControllerState copyWith({Map<int, int>? quantityMap}) {
    return CountControllerState(
      quantityMap: quantityMap ?? this.quantityMap,
    );
  }
}

final class CountControllerInitial extends CountControllerState {}
