part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class FetchFoodsByCategory extends FoodEvent {
  final int categoryId;

  FetchFoodsByCategory(this.categoryId);
}
