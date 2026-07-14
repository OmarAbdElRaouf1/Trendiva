import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/cart/data/models/cart_model.dart';

class CartRepository {
  CartRepository(this._apiService);

  final ApiService _apiService;

  Future<CartModel> getCart() async {
    final response = await _apiService.get(EndPoints.cart);
    return CartModel.fromJson(response as Map<String, dynamic>);
  }

  Future<CartModel> addItem({
    required String productId,
    required int quantity,
  }) async {
    await _apiService.post(EndPoints.cartItems, {
      'productId': productId,
      'quantity': quantity,
    });
    return getCart();
  }

  Future<CartModel> decrementItem({
    required String itemId,
    required int quantity,
  }) async {
    await _apiService.post(EndPoints.decrementCartItem, {
      'itemId': itemId,
      'quantity': quantity,
    });
    return getCart();
  }

  Future<CartModel> removeItem(String itemId) async {
    await _apiService.delete(EndPoints.cartItemById(itemId), {'id': itemId});
    return getCart();
  }
}
