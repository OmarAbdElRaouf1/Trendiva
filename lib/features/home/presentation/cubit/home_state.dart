import 'package:equatable/equatable.dart';
import 'package:trendiva/features/home/data/models/category_model.dart';
import 'package:trendiva/features/home/data/models/offer_model.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.products,
    required this.categories,
    required this.offers,
  });

  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final List<OfferModel> offers;

  @override
  List<Object?> get props => [products, categories, offers];
}

class HomeError extends HomeState {
  const HomeError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
