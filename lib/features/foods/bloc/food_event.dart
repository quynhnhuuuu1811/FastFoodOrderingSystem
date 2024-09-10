part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class FetchFoodsByCategory extends FoodEvent {
  final int categoryId;

  FetchFoodsByCategory(this.categoryId);
}


class AddFood extends FoodEvent {
  final String name;
  final int price;
  final String image;
  final int category;

  AddFood(this.name, this.price, this.image, this.category);
}

class DeleteFood extends FoodEvent {
  final int id;

  DeleteFood(this.id);
}

class UpdateFood extends FoodEvent {
  final int id;
  final String name;
  final int price;
  final String image;
  final int category;

  UpdateFood({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category
  });
}

class FetchAllFoods extends FoodEvent {}

class ResetState extends FoodEvent {
}