import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:trendiva/features/home/presentation/cubit/home_cubit.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 40,
            color: AppColors.greyTextColor,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.greyTextColor),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<HomeCubit>().loadHome();
              context.read<CategoriesCubit>().loadCategories();
              context.read<CartCubit>().loadCart();
              context.read<ProfileCubit>().loadProfile();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
