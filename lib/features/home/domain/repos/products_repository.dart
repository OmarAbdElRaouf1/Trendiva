import 'package:trendiva/features/home/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProducts();
}
