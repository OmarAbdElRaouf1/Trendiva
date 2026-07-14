import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';
import 'package:trendiva/features/home/presentation/views/widgets/product_card.dart';
import 'package:trendiva/features/home/presentation/views/widgets/section_header.dart';

class ProductsGridSection extends StatelessWidget {
  const ProductsGridSection({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'All Products',
          trailing: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.tune,
              size: 18,
              color: context.colors.textPrimary,
            ),
          ),
        ),
        Gap(16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.50,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
