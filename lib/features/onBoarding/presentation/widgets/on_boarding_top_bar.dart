import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class OnBoardingTopBar extends StatelessWidget {
  final VoidCallback onSkip;

  const OnBoardingTopBar({
    super.key,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/trendiva_logo.png',
            width: 34,
            height: 34,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Trendiva',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onSkip,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffE5E2DD),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}