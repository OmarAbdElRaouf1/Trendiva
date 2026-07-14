import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/widgets/shimmer_box.dart';

class CartSkeleton extends StatelessWidget {
  const CartSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.surfaceMuted,
      highlightColor: context.colors.surface,
      child: ListView(
        children: [
          Gap(32.h),
          const ShimmerBox(width: 200, height: 28),
          Gap(8.h),
          const ShimmerBox(width: 120, height: 16),
          Gap(24.h),
          for (int i = 0; i < 3; i++) ...[
            _CartItemSkeleton(),
            Gap(24.h),
          ],
        ],
      ),
    );
  }
}

class _CartItemSkeleton extends StatelessWidget {
  const _CartItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(width: 150.w, height: 150.h, borderRadius: 12),
          Gap(16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerBox(width: 140, height: 18),
                  Gap(10.h),
                  const ShimmerBox(width: 70, height: 16),
                  Gap(12.h),
                  ShimmerBox(width: 110.w, height: 40.h, borderRadius: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
