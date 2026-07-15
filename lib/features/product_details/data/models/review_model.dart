import 'package:trendiva/features/product_details/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.comment,
    required super.rating,
    required super.userName,
    super.createdAt,
    super.userPicture,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      comment: json['comment'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      userName: json['userName'] as String? ?? 'Anonymous',
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
      userPicture: json['userPicture'] as String?,
    );
  }
}
