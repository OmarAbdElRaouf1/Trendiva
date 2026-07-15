import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/home/domain/repos/categories_repository.dart';
import 'package:trendiva/features/home/domain/repos/offers_repository.dart';
import 'package:trendiva/features/home/domain/repos/products_repository.dart';
import 'package:trendiva/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._productsRepository,
    this._categoriesRepository,
    this._offersRepository,
  ) : super(const HomeInitial());

  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  final OffersRepository _offersRepository;

  Future<void> loadHome() async {
    emit(const HomeLoading());
    try {
      final productsFuture = _productsRepository.getProducts();
      final categoriesFuture = _categoriesRepository.getCategories();
      final offersFuture = _offersRepository.getOffers();

      final products = await productsFuture;
      final categories = await categoriesFuture;
      final offers = await offersFuture;

      emit(
        HomeLoaded(products: products, categories: categories, offers: offers),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
