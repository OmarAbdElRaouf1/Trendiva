import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

import '../../../../../core/theme/app_theme_colors.dart';
class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(rating: product.rating),
        Gap(8.w),
        Text(
          '${product.rating}  (${product.reviewCount} Reviews)',
          style: TextStyle(fontSize: 13, color: context.colors.textMuted),
        ),
      ],
    );
  }
}