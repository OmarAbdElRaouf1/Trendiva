import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trendiva/core/widgets/shimmer_box.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEDEAE6),
      highlightColor: const Color(0xFFFAF8F6),
      child: Column(
        children: [
          const ShimmerBox.circle(size: 128),
          Gap(20.h),
          const ShimmerBox(width: 160, height: 20),
          Gap(8.h),
          const ShimmerBox(width: 200, height: 14),
          Gap(32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) => const ShimmerBox(
                width: 100,
                height: 88,
                borderRadius: 12,
              ),
            ),
          ),
          Gap(32.h),
          ShimmerBox(width: double.infinity, height: 148, borderRadius: 12),
          Gap(32.h),
          ShimmerBox(width: double.infinity, height: 180, borderRadius: 12),
        ],
      ),
    );
  }
}
