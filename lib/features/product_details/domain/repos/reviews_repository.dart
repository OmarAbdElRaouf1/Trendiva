import 'package:trendiva/features/product_details/domain/entities/reviews_page_entity.dart';

abstract class ReviewsRepository {
  Future<ReviewsPageEntity> getReviews(
    String productId, {
    int page = 1,
    int pageSize = 10,
  });

  Future<void> createReview({
    required String productId,
    required String comment,
    required int rating,
  });
}
