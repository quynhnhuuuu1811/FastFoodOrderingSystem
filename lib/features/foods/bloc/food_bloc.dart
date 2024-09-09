import 'package:bloc/bloc.dart';
import 'package:fastfood_ordering_system/features/foods/data/food_repository.dart';
import 'package:meta/meta.dart';

import '../dtos/food_dto.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this._foodRepository) : super(FoodInitial()) {
    on<FetchFoodsByCategory>(_onFetchFoodsByCategory);
    on<AddFood>(_onAddFood);
    on<UpdateFood>(_onUpdateFood);
    on<DeleteFood>(_onDeleteFood);
    on<FetchAllFoods>(_onFetchAllFoods);
  }
  final FoodRepository _foodRepository ;
  void _onFetchFoodsByCategory(
    FetchFoodsByCategory event,
    Emitter<FoodState> emit,
  ) async {
    emit(state.copyWith(status: FoodStatus.loading));
    try {
      print('categoryId: ${event.categoryId}');
      final foods = await _foodRepository.fetchFoodsByCategory(event.categoryId);
      print('foods: $foods');
      emit(state.copyWith(status: FoodStatus.success, foods: foods));
    } catch (e) {
      emit(state.copyWith(status: FoodStatus.failure, message: e.toString()));
    }
  }

  void  _onAddFood(
    AddFood event,
    Emitter<FoodState> emit,
  ) async {
    emit(state.copyWith(status: FoodStatus.loading));
    try {
      final food = await _foodRepository.addFood(event.name, event.price, event.image, event.category);
      emit(state.copyWith(status: FoodStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FoodStatus.failure, message: e.toString()));
    }
  }

  void _onUpdateFood(
    UpdateFood event,
    Emitter<FoodState> emit,
  ) async {
    emit(state.copyWith(status: FoodStatus.loading));
    try {
      final food = await _foodRepository.updateFood(event.id, event.name, event.price, event.image, event.category);
      emit(state.copyWith(status: FoodStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FoodStatus.failure, message: e.toString()));
    }
  }

  void _onDeleteFood(
    DeleteFood event,
    Emitter<FoodState> emit,
  ) async {
    emit(state.copyWith(status: FoodStatus.loading));
    try {
      await _foodRepository.deleteFood(event.id);
      emit(state.copyWith(status: FoodStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FoodStatus.failure, message: e.toString()));
    }
  }

  void _onFetchAllFoods(
    FetchAllFoods event,
    Emitter<FoodState> emit,
  ) async {
    emit(state.copyWith(status: FoodStatus.loading));
    try {
      final foods = await _foodRepository.fetchFoodAllFood();
      emit(state.copyWith(status: FoodStatus.success, foods: foods));
    } catch (e) {
      emit(state.copyWith(status: FoodStatus.failure, message: e.toString()));
    }
  }
}
