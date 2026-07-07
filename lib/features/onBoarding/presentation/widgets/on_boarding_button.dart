import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class OnBoardingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnBoardingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}