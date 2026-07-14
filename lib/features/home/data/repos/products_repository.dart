import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';

class ProductsRepository {
  ProductsRepository(this._apiService);

  final ApiService _apiService;
  Future<List<ProductModel>>? _productsFuture;

  Future<List<ProductModel>> getProducts() {
    return _productsFuture ??= _fetchProducts();
  }

  Future<List<ProductModel>> _fetchProducts() async {
    try {
      final response = await _apiService.get(EndPoints.products);
      final items = (response as Map<String, dynamic>)['items'] as List;
      return items
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _productsFuture = null;
      rethrow;
    }
  }
}
