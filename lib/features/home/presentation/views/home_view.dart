import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/home/data/repos/products_repository.dart';
import 'package:nti_final_project/features/home/presentation/cubit/products_cubit.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(ProductsRepository())..loadProducts(),
      child: const Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
