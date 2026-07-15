import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';
import 'package:trendiva/features/product_details/domain/repos/reviews_repository.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_cubit.dart';

import 'package:trendiva/features/product_details/presentation/views/widgets/product_image_header.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/rating_row.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/review_section.dart';


import 'widgets/price_row.dart';
import 'widgets/write_review_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ReviewsCubit(sl<ReviewsRepository>(), product.id)..loadReviews(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageHeader(image: product.image),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingRow(product: product),
                      Gap(12.h),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: context.colors.textPrimary,
                        ),
                      ),
                      Gap(12.h),
                      PriceRow(product: product),
                      Gap(28.h),
                      const _SectionLabel('DESCRIPTION'),
                      Gap(12.h),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      Gap(28.h),
                      const Divider(height: 1),
                      Gap(24.h),
                      const ReviewsSection(),
                      Gap(24.h),
                      const WriteReviewButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: context.colors.textMuted,
      ),
    );
  }
}


