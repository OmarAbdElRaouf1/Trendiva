import 'package:trendiva/features/cart/data/models/cart_item_model.dart';
import 'package:trendiva/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({required super.cartId, required super.items});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final items = json['cartItems'] as List;
    return CartModel(
      cartId: json['cartId'] as String,
      items: items
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
