import 'package:trendiva/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  const CartEntity({required this.cartId, required this.items});

  final String cartId;
  final List<CartItemEntity> items;

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.totalPrice);
}
