import 'package:fastfood_ordering_system/features/category/dtos/category_dto.dart';

class CategoryRepository{
  final CategoryApiClient;

  CategoryRepository({
    required this.CategoryApiClient
  });

  Future<List<CategoryDto>> fetchCategories() async {
    return CategoryApiClient.getCategories();
  }
}