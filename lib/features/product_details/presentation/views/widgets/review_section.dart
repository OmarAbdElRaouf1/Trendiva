import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/review_tile.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../cubit/reviews_cubit.dart';
import '../../cubit/reviews_state.dart';
class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        return switch (state) {
          ReviewsInitial() || ReviewsLoading() => const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          ),
          ReviewsError(:final message) => Text(
            'Failed to load reviews: $message',
            style: TextStyle(color: context.colors.textMuted),
          ),
          ReviewsLoaded(
            :final items,
            :final averageRating,
            :final reviewsCount,
          ) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    Gap(10.w),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: StarRating(rating: averageRating, size: 14),
                    ),
                    Gap(6.w),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        '${averageRating.toStringAsFixed(1)} ($reviewsCount Reviews)',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.colors.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                if (items.isEmpty)
                  Text(
                    'No reviews yet. Be the first to write one!',
                    style: TextStyle(color: context.colors.textMuted),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length > 3 ? 3 : items.length,
                    separatorBuilder: (_, _) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(height: 1),
                    ),
                    itemBuilder: (context, index) =>
                        ReviewTile(review: items[index]),
                  ),
                if (reviewsCount > 0) ...[
                  Gap(12.h),
                  Center(
                    child: TextButton(
                      onPressed: () => context.pushNamed(
                        Routes.allReviewsView,
                        arguments: context.read<ReviewsCubit>(),
                      ),
                      child: const Text('View All Reviews'),
                    ),
                  ),
                ],
              ],
            ),
        };
      },
    );
  }
}
