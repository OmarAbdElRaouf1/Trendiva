import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/product_image_header.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/review_tile.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/star_rating.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    _RatingRow(product: product),
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
                    _PriceRow(product: product),
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
                    _ReviewsSection(product: product),
                    Gap(24.h),
                    const _WriteReviewButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(rating: product.rating),
        Gap(8.w),
        Text(
          '${product.rating}  (${product.reviewCount} Reviews)',
          style: TextStyle(fontSize: 13, color: context.colors.textMuted),
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: context.colors.primary,
          ),
        ),
        if (product.oldPrice != null) ...[
          Gap(10.w),
          Text(
            '\$${product.oldPrice!.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              color: context.colors.textMuted,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
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

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: StarRating(rating: product.rating, size: 14),
            ),
            Gap(6.w),
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                '${product.rating} (${product.reviewCount} Reviews)',
                style: TextStyle(fontSize: 12, color: context.colors.textMuted),
              ),
            ),
          ],
        ),
        Gap(20.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: product.reviews.length,
          separatorBuilder: (_, _) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 1),
          ),
          itemBuilder: (context, index) =>
              ReviewTile(review: product.reviews[index]),
        ),
      ],
    );
  }
}

class _WriteReviewButton extends StatelessWidget {
  const _WriteReviewButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          side: BorderSide(color: context.colors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Write a Review',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
