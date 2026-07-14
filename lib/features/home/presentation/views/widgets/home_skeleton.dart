import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trendiva/core/widgets/shimmer_box.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: const Color(0xFFEDEAE6),
      highlightColor: const Color(0xFFFAF8F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 248,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ShimmerBox(width: width * .78, height: 248, borderRadius: 20),
              ],
            ),
          ),
          Gap(28.h),
          const ShimmerBox(width: 90, height: 20),
          Gap(16.h),
          SizedBox(
            height: 100.h,
            child: Row(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      const ShimmerBox.circle(size: 56),
                      Gap(8.h),
                      const ShimmerBox(width: 48, height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Gap(28.h),
          const ShimmerBox(width: 120, height: 20),
          Gap(16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.50,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ShimmerBox(
                      width: double.infinity,
                      height: double.infinity,
                      borderRadius: 18,
                    ),
                  ),
                  Gap(24.h),
                  const ShimmerBox(width: 60, height: 12),
                  Gap(6.h),
                  const ShimmerBox(width: 100, height: 14),
                  Gap(6.h),
                  const ShimmerBox(width: 50, height: 14),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
