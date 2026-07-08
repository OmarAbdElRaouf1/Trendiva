import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_colors.dart';

class PasswordStrength extends StatelessWidget {
  const PasswordStrength({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            4,
            (index) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 4),
                height: 5,
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColors.neutralColor
                      : AppColors.tertiaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Gap(6.h),
        Text(
          'Password Strength : Weak',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
