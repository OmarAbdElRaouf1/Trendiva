import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.colors.border.withValues(alpha: 0.5)),
      ),
      child: TextField(
        style: TextStyle(color: context.colors.textPrimary),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          prefixIcon: Icon(Icons.search, color: context.colors.textMuted),
          hintText: 'Search curated collections...',
          hintStyle: AppTextStyles.searchHint(context),
        ),
      ),
    );
  }
}
