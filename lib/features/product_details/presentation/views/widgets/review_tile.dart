import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.author,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            Text(
              review.timeAgo,
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
        Gap(10.h),
        Row(
          children: [
            Icon(Icons.thumb_up_alt_outlined, size: 15, color: context.colors.textMuted),
            Gap(6.w),
            Text(
              'Helpful (${review.helpfulCount})',
              style: TextStyle(fontSize: 13, color: context.colors.textMuted),
            ),
          ],
        ),
      ],
    );
  }
}
