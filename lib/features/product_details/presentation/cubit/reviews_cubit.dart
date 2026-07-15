import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/product_details/domain/repos/reviews_repository.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._repository, this.productId) : super(const ReviewsInitial());

  final ReviewsRepository _repository;
  final String productId;

  Future<void> loadReviews() async {
    emit(const ReviewsLoading());
    try {
      final result = await _repository.getReviews(productId);
      emit(
        ReviewsLoaded(
          items: result.items,
          averageRating: result.averageRating,
          reviewsCount: result.reviewsCount,
          page: result.page,
          hasNextPage: result.hasNextPage,
        ),
      );
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! ReviewsLoaded ||
        !current.hasNextPage ||
        current.isLoadingMore) {
      return;
    }
    emit(current.copyWith(isLoadingMore: true));
    try {
      final result = await _repository.getReviews(
        productId,
        page: current.page + 1,
      );
      emit(
        current.copyWith(
          items: [...current.items, ...result.items],
          page: result.page,
          hasNextPage: result.hasNextPage,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      emit(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> submitReview({
    required String comment,
    required int rating,
  }) async {
    final current = state;
    if (current is ReviewsLoaded) {
      emit(current.copyWith(isSubmitting: true));
    }
    try {
      await _repository.createReview(
        productId: productId,
        comment: comment,
        rating: rating,
      );
      await loadReviews();
    } catch (e) {
      if (current is ReviewsLoaded) {
        emit(current.copyWith(isSubmitting: false));
      }
      rethrow;
    }
  }
}
