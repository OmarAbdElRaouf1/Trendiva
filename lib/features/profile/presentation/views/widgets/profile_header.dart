import 'package:flutter/material.dart';
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
        const SizedBox(height: 20),
        const Text('Mahmoud Elsebaei', style: AppTextStyles.profileName),
        const SizedBox(height: 4),
        const Text(
          'mahmoudelsebaei@trendiva.com',
          style: AppTextStyles.profileEmail,
        ),
      ],
    );
  }
}
