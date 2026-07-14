import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.label});

  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colors.border.withValues(alpha: 0.35),
            shape: BoxShape.circle,
          ),
          child: image.isEmpty
              ? Icon(
                  Icons.category_outlined,
                  color: context.colors.textPrimary,
                )
              : CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => Icon(
                    Icons.category_outlined,
                    color: context.colors.textPrimary,
                  ),
                ),
        ),
        Gap(8.h),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.categoryLabel(context),
        ),
      ],
    );
  }
}
