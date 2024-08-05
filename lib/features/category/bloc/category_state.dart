part of 'category_bloc.dart';

enum CategoryStatus{initial, loading, loaded, error}


final class CategoryState {
  late final CategoryStatus status;
  late final List<CategoryDto> categories;
  late final String? message;

  CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const [],
    this.message,
  });

  CategoryState copyWith({
    CategoryStatus? status,
    List<CategoryDto>? categories,
    String? message,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      message: message ?? this.message,
    );
  }
}

final class CategoryInitial extends CategoryState {}
