import 'package:flutter/material.dart';

class OnBoardingBackground extends StatelessWidget {
  const OnBoardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/onboarding_fashion.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
            return Container(
             color: const Color(0xffF5F5F1),
      );
      },
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.white.withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }
}