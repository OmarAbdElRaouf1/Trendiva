import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class PasswordRequirementsCard extends StatelessWidget {
  const PasswordRequirementsCard({super.key});

  static const _requirements = [
    'At least 8 characters',
    'Include at least one number',
    'One special character (@!%*+?)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: AppColors.secondaryColor,
      child: Column(
        children: [
          for (int i = 0; i < _requirements.length; i++) ...[
            if (i > 0) Gap(8.h),
            _RequirementItem(text: _requirements[i]),
          ],
        ],
      ),
    );
  }
}

class _RequirementItem extends StatelessWidget {
  const _RequirementItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline),
        Gap(8.w),
        Expanded(
          child: Text(text, style: AppTextStyles.passwordRequirementText),
        ),
      ],
    );
  }
}
