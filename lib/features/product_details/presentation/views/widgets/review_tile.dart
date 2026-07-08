import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_colors.dart';
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.neutralColor,
              ),
            ),
            Text(
              review.timeAgo,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Gap(6.h),
        StarRating(rating: review.rating, size: 14),
        Gap(8.h),
        Text(
          review.comment,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
        Gap(10.h),
        Row(
          children: [
            const Icon(Icons.thumb_up_alt_outlined, size: 15, color: Colors.grey),
            Gap(6.w),
            Text(
              'Helpful (${review.helpfulCount})',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
