import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/widgets/shimmer_box.dart';

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.surfaceMuted,
      highlightColor: context.colors.surface,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: ShimmerBox(
                  width: double.infinity,
                  height: double.infinity,
                  borderRadius: 18,
                ),
              ),
              Gap(10),
              const ShimmerBox(width: 80, height: 14),
            ],
          );
        },
      ),
    );
  }
}
