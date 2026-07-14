import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.photo,
  });

  final String name;
  final String email;
  final File? photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: context.colors.primary, width: 2),
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: photo == null
                    ? const AssetImage('assets/photos/profile_photo.png')
                    : FileImage(photo!) as ImageProvider,
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
        Text(name, style: AppTextStyles.profileName(context)),
        Gap(4.h),
        Text(email, style: AppTextStyles.profileEmail(context)),
      ],
    );
  }
}
