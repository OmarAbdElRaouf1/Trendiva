import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double height;
  final double shadowAlpha;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.height = 52,
    this.shadowAlpha = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          shadowColor: AppColors.primaryColor.withValues(alpha: shadowAlpha),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        child: icon == null
            ? Text(text, style: AppTextStyles.authButton)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text, style: AppTextStyles.authButton),
                  Gap(8.w),
                  Icon(icon, size: 18),
                ],
              ),
      ),
    );
  }
}
