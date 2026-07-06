import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage('assets/photos/profile_photo.png'),
          ),
        ),
        Gap(20.h),
        const Text('Mahmoud Elsebaei', style: AppTextStyles.profileName),
        Gap(4.h),
        const Text(
          'mahmoudelsebaei@trendiva.com',
          style: AppTextStyles.profileEmail,
        ),
      ],
    );
  }
}
