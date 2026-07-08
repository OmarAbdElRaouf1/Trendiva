import 'package:flutter/material.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import '../widgets/on_boarding_background.dart';
import '../widgets/on_boarding_button.dart';
import '../widgets/on_boarding_top_bar.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnBoardingBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnBoardingTopBar(
                    onSkip: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginView,
                      );
                    },
                  ),
                  const Spacer(flex: 3),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Discover the\n'),
                        TextSpan(
                          text: 'Latest Trends.',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      color: Color(0xff181818),
                      fontSize: 30,
                      height: 1.18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Explore thousands of products from top\n'
                    'brands, curated just for you. Your journey\n'
                    'into effortless luxury begins here.',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.58),
                      fontSize: 15,
                      height: 1.55,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(flex: 4),
                  Center(
                    child: Container(
                      width: 28,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  OnBoardingButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginView,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}