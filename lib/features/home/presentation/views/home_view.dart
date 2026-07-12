import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/features/home/presentation/cubit/home_cubit.dart';
import 'package:trendiva/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..loadHome(),
      child: const Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
