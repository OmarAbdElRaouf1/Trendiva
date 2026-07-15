import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/cart/data/models/cart_model.dart';
import 'package:trendiva/features/cart/domain/entities/cart_entity.dart';
import 'package:trendiva/features/cart/domain/repos/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<CartEntity> getCart() async {
    final response = await _apiService.get(EndPoints.cart);
    return CartModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<CartEntity> addItem({
    required String productId,
    required int quantity,
  }) async {
    await _apiService.post(EndPoints.cartItems, {
      'productId': productId,
      'quantity': quantity,
    });
    return getCart();
  }

  @override
  Future<CartEntity> decrementItem({
    required String itemId,
    required int quantity,
  }) async {
    await _apiService.post(EndPoints.decrementCartItem, {
      'itemId': itemId,
      'quantity': quantity,
    });
    return getCart();
  }

  @override
  Future<CartEntity> removeItem(String itemId) async {
    await _apiService.delete(EndPoints.cartItemById(itemId), {'id': itemId});
    return getCart();
  }
}
