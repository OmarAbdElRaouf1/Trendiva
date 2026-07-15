import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_cubit.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_state.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/review_tile.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

class AllReviewsView extends StatelessWidget {
  const AllReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Reviews')),
      body: SafeArea(
        child: BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            return switch (state) {
              ReviewsInitial() || ReviewsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              ReviewsError(:final message) => _ReviewsErrorView(
                message: message,
              ),
              ReviewsLoaded() => _ReviewsList(state: state),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(
          Routes.writeReviewView,
          arguments: context.read<ReviewsCubit>(),
        ),
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Write a Review'),
      ),
    );
  }
}

class _ReviewsErrorView extends StatelessWidget {
  const _ReviewsErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 40,
              color: context.colors.textMuted,
            ),
            const SizedBox(height: 12),
            Text(
              'Failed to load reviews: $message',
              textAlign: TextAlign.center,
              style: TextStyle(color: context.colors.textMuted),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => context.read<ReviewsCubit>().loadReviews(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewsList extends StatelessWidget {
  const _ReviewsList({required this.state});

  final ReviewsLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: _ReviewsHeader(state: state),
        ),
        Expanded(
          child: state.items.isEmpty
              ? Center(
                  child: Text(
                    'No reviews yet. Be the first to write one!',
                    style: TextStyle(color: context.colors.textMuted),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(height: 1, color: context.colors.divider),
                  ),
                  itemBuilder: (context, index) =>
                      ReviewTile(review: state.items[index]),
                ),
        ),
        if (state.hasNextPage)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: state.isLoadingMore
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : TextButton(
                    onPressed: () => context.read<ReviewsCubit>().loadMore(),
                    child: const Text('Load More'),
                  ),
          ),
      ],
    );
  }
}

class _ReviewsHeader extends StatelessWidget {
  const _ReviewsHeader({required this.state});

  final ReviewsLoaded state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          state.averageRating.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        Gap(16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StarRating(rating: state.averageRating, size: 18),
            Gap(4.h),
            Text(
              '${state.reviewsCount} reviews',
              style: TextStyle(color: context.colors.textMuted),
            ),
          ],
        ),
      ],
    );
  }
}
