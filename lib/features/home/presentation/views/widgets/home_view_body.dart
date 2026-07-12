import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/features/home/presentation/cubit/home_cubit.dart';
import 'package:trendiva/features/home/presentation/cubit/home_state.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            Gap(16.h),
            const HomeSearchBar(),
            Gap(20.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return switch (state) {
                  HomeInitial() || HomeLoading() => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  HomeError(:final message) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Center(child: Text('Failed to load home: $message')),
                  ),
                  HomeLoaded(
                    :final products,
                    :final categories,
                    :final offers,
                  ) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PromoBannerSection(offers: offers),
                        Gap(28.h),
                        CategoriesSection(categories: categories),
                        Gap(28.h),
                        ProductsGridSection(products: products),
                      ],
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
