import 'package:trendiva/features/product_details/domain/entities/review_entity.dart';

class ReviewsPageEntity {
  const ReviewsPageEntity({
    required this.items,
    required this.averageRating,
    required this.reviewsCount,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  final List<ReviewEntity> items;
  final double averageRating;
  final int reviewsCount;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;
}
