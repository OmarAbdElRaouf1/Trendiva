import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.tertiaryColor.withValues(alpha: 0.35),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.neutralColor, size: 24),
        ),
        Gap(8.h),
        Text(label, style: AppTextStyles.categoryLabel),
      ],
    );
  }
}
