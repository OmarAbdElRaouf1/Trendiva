import 'package:trendiva/features/product_details/data/models/review_model.dart';
import 'package:trendiva/features/product_details/domain/entities/reviews_page_entity.dart';

class ReviewsPageModel extends ReviewsPageEntity {
  const ReviewsPageModel({
    required super.items,
    required super.averageRating,
    required super.reviewsCount,
    required super.page,
    required super.pageSize,
    required super.totalCount,
    required super.hasNextPage,
    required super.hasPreviousPage,
  });

  factory ReviewsPageModel.fromJson(Map<String, dynamic> json) {
    final reviews = json['reviews'] as Map<String, dynamic>? ?? const {};
    final items = reviews['items'] as List? ?? const [];
    return ReviewsPageModel(
      items: items
          .map((item) => ReviewModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      reviewsCount: json['reviewsCount'] as int? ?? 0,
      page: reviews['page'] as int? ?? 1,
      pageSize: reviews['pageSize'] as int? ?? items.length,
      totalCount: reviews['totalCount'] as int? ?? items.length,
      hasNextPage: reviews['hasNextPage'] as bool? ?? false,
      hasPreviousPage: reviews['hasPreviousPage'] as bool? ?? false,
    );
  }
}
