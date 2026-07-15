import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/product_details/data/models/reviews_page_model.dart';
import 'package:trendiva/features/product_details/domain/entities/reviews_page_entity.dart';
import 'package:trendiva/features/product_details/domain/repos/reviews_repository.dart';

class ReviewsRepositoryImpl implements ReviewsRepository {
  ReviewsRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ReviewsPageEntity> getReviews(
    String productId, {
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _apiService.get(
      '${EndPoints.reviews(productId)}?page=$page&pageSize=$pageSize',
    );
    return ReviewsPageModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> createReview({
    required String productId,
    required String comment,
    required int rating,
  }) {
    return _apiService.post(EndPoints.reviews(productId), {
      'productId': productId,
      'comment': comment,
      'rating': rating,
    });
  }
}
