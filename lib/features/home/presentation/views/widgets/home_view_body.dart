import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/categories_section.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/products_grid_section.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/promo_banner_section.dart';

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
          const SizedBox(height: 16),
          const HomeSearchBar(),
          const SizedBox(height: 20),
          const PromoBannerSection(),
          const SizedBox(height: 28),
          const CategoriesSection(),
          const SizedBox(height: 28),
          const ProductsGridSection(),
        ],
      ),
    );
  }
}
