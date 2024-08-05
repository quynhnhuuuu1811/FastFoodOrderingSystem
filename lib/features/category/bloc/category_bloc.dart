import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/category_repository.dart';
import '../dtos/category_dto.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._categoryRepository) : super(CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }
  final CategoryRepository _categoryRepository ;
  void  _onFetchCategories(FetchCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final categories = await _categoryRepository.fetchCategories();
      emit(state.copyWith(status: CategoryStatus.loaded, categories: categories));
    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.error, message: e.toString()));
    }
  }
}
