part of 'food_bloc.dart';

enum  FoodStatus { initial, loading, success,updateSuccess, failure }
final class FoodState {
  final List<FoodDto> foods;
  final FoodStatus status;
  final String message;
  FoodState({
     this.foods=const [],
    this.status=FoodStatus.initial,
    this.message="",
  });
  FoodState copyWith({
    List<FoodDto>? foods,
    FoodStatus? status,
    String? message,
  }) {
    return FoodState(
      foods: foods ?? this.foods,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

final class FoodInitial extends FoodState {}
