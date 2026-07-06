import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/repos/products_repository.dart';
import 'package:nti_final_project/features/home/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(const ProductsInitial());

  final ProductsRepository _repository;

  Future<void> loadProducts() async {
    emit(const ProductsLoading());
    try {
      final products = await _repository.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
