import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/profile/data/profile_data.dart';

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
          child: Stack(
            children: [
              ValueListenableBuilder<File?>(
                valueListenable: ProfileData.photo,
                builder: (context, photo, _) => CircleAvatar(
                  radius: 64,
                  backgroundImage: photo == null
                      ? const AssetImage('assets/photos/profile_photo.png')
                      : FileImage(photo),
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(radius: 14, backgroundColor: Colors.white),
              ),
              const Positioned(
                right: 2,
                bottom: 2.5,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.darkGreenColor,
                ),
              ),
              Positioned(
                right: 7,
                bottom: 7.5,
                child: SvgPicture.asset(
                  'assets/icons/profile_icons/edit_profile_photo.svg',
                ),
              ),
            ],
          ),
        ),
        Gap(20.h),
        ValueListenableBuilder<String>(
          valueListenable: ProfileData.name,
          builder: (context, name, _) =>
              Text(name, style: AppTextStyles.profileName),
        ),
        Gap(4.h),
        ValueListenableBuilder<String>(
          valueListenable: ProfileData.email,
          builder: (context, email, _) =>
              Text(email, style: AppTextStyles.profileEmail),
        ),
      ],
    );
  }
}
