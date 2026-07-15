import 'package:equatable/equatable.dart';
import 'package:trendiva/features/product_details/domain/entities/review_entity.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object?> get props => [];
}

class ReviewsInitial extends ReviewsState {
  const ReviewsInitial();
}

class ReviewsLoading extends ReviewsState {
  const ReviewsLoading();
}

class ReviewsLoaded extends ReviewsState {
  const ReviewsLoaded({
    required this.items,
    required this.averageRating,
    required this.reviewsCount,
    required this.page,
    required this.hasNextPage,
    this.isLoadingMore = false,
    this.isSubmitting = false,
  });

  final List<ReviewEntity> items;
  final double averageRating;
  final int reviewsCount;
  final int page;
  final bool hasNextPage;
  final bool isLoadingMore;
  final bool isSubmitting;

  ReviewsLoaded copyWith({
    List<ReviewEntity>? items,
    double? averageRating,
    int? reviewsCount,
    int? page,
    bool? hasNextPage,
    bool? isLoadingMore,
    bool? isSubmitting,
  }) {
    return ReviewsLoaded(
      items: items ?? this.items,
      averageRating: averageRating ?? this.averageRating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [
    items,
    averageRating,
    reviewsCount,
    page,
    hasNextPage,
    isLoadingMore,
    isSubmitting,
  ];
}

class ReviewsError extends ReviewsState {
  const ReviewsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
