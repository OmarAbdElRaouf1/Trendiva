import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/category_model.dart';
import 'package:trendiva/features/home/domain/entities/category_entity.dart';
import 'package:trendiva/features/home/domain/repos/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._apiService);

  final ApiService _apiService;
  Future<List<CategoryEntity>>? _categoriesFuture;

  @override
  Future<List<CategoryEntity>> getCategories() {
    return _categoriesFuture ??= _fetchCategories();
  }

  Future<List<CategoryEntity>> _fetchCategories() async {
    try {
      final response = await _apiService.get(EndPoints.categories);
      final categories =
          (response as Map<String, dynamic>)['categories'] as List;
      return categories
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _categoriesFuture = null;
      rethrow;
    }
  }
}
