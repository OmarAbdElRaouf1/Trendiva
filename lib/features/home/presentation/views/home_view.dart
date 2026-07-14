import 'package:flutter/material.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
