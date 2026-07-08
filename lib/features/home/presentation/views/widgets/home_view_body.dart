import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/features/home/presentation/views/widgets/categories_section.dart';
import 'package:trendiva/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:trendiva/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:trendiva/features/home/presentation/views/widgets/products_grid_section.dart';
import 'package:trendiva/features/home/presentation/views/widgets/promo_banner_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          Gap(16.h),
          const HomeSearchBar(),
          Gap(20.h),
          const PromoBannerSection(),
          Gap(28.h),
          const CategoriesSection(),
          Gap(28.h),
          const ProductsGridSection(),
        ],
      ),
    );
  }
}
