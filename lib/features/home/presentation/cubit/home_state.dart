import 'package:equatable/equatable.dart';
import 'package:trendiva/features/home/domain/entities/category_entity.dart';
import 'package:trendiva/features/home/domain/entities/offer_entity.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';

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

  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  final List<OfferEntity> offers;

  @override
  List<Object?> get props => [products, categories, offers];
}

class HomeError extends HomeState {
  const HomeError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
