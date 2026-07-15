import 'package:trendiva/features/home/domain/entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<List<CategoryEntity>> getCategories();
}
