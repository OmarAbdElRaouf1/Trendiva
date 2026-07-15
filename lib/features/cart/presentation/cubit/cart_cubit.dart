import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/cart/domain/repos/cart_repository.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._repository) : super(const CartInitial());

  final CartRepository _repository;

  Future<void> loadCart() async {
    emit(const CartLoading());
    try {
      final cart = await _repository.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addItem({required String productId, int quantity = 1}) async {
    try {
      final cart = await _repository.addItem(
        productId: productId,
        quantity: quantity,
      );
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> decrementItem({
    required String itemId,
    int quantity = 1,
  }) async {
    try {
      final cart = await _repository.decrementItem(
        itemId: itemId,
        quantity: quantity,
      );
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeItem(String itemId) async {
    try {
      final cart = await _repository.removeItem(itemId);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
