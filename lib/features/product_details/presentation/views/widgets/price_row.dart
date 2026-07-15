import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';

import '../../../../../core/theme/app_theme_colors.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: context.colors.primary,
          ),
        ),
        if (product.oldPrice != null) ...[
          Gap(10.w),
          Text(
            '\$${product.oldPrice!.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              color: context.colors.textMuted,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }
}
