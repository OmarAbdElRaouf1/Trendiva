import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/product_details/domain/entities/review_entity.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final ReviewEntity review;

  String get _timeAgo {
    final createdAt = review.createdAt;
    if (createdAt == null) return '';
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 365) return '${diff.inDays ~/ 365}y ago';
    if (diff.inDays >= 30) return '${diff.inDays ~/ 30}mo ago';
    if (diff.inDays >= 1) return '${diff.inDays}d ago';
    if (diff.inHours >= 1) return '${diff.inHours}h ago';
    if (diff.inMinutes >= 1) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.userName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            Text(
              _timeAgo,
              style: TextStyle(fontSize: 12, color: context.colors.textMuted),
            ),
          ],
        ),
        Gap(6.h),
        StarRating(rating: review.rating, size: 14),
        Gap(8.h),
        Text(
          review.comment,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
