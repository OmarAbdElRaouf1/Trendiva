import 'package:trendiva/features/cart/data/models/cart_item_model.dart';

class CartModel {
  const CartModel({required this.cartId, required this.items});

  final String cartId;
  final List<CartItemModel> items;

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.totalPrice);

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
