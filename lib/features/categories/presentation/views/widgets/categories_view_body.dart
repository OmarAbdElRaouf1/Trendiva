import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/widgets/retry_button.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_state.dart';
import 'package:trendiva/features/categories/presentation/views/widgets/categories_skeleton.dart';
import 'package:trendiva/features/categories/presentation/views/widgets/category_grid_card.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return switch (state) {
            CategoriesInitial() || CategoriesLoading() =>
              const CategoriesSkeleton(),
            CategoriesError(:final message) => Center(
              child: RetryButton(message: 'Failed to load categories: $message'),
            ),
            CategoriesLoaded(:final categories) => GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return CategoryGridCard(category: categories[index]);
              },
            ),
          };
        },
      ),
    );
  }
}
