import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/category_model.dart';

class CategoriesRepository {
  CategoriesRepository(this._apiService);

  final ApiService _apiService;
  Future<List<CategoryModel>>? _categoriesFuture;

  Future<List<CategoryModel>> getCategories() {
    return _categoriesFuture ??= _fetchCategories();
  }

  Future<List<CategoryModel>> _fetchCategories() async {
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
