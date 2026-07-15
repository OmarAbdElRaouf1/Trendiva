import 'package:trendiva/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> getCart();

  Future<CartEntity> addItem({
    required String productId,
    required int quantity,
  });

  Future<CartEntity> decrementItem({
    required String itemId,
    required int quantity,
  });

  Future<CartEntity> removeItem(String itemId);
}
