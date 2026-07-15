import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';
import 'package:trendiva/features/home/domain/repos/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl(this._apiService);

  final ApiService _apiService;
  Future<List<ProductEntity>>? _productsFuture;

  @override
  Future<List<ProductEntity>> getProducts() {
    return _productsFuture ??= _fetchProducts();
  }

  Future<List<ProductEntity>> _fetchProducts() async {
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
