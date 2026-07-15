import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.photo,
    this.onEditPhoto,
  });

  final String name;
  final String email;
  final File? photo;
  final VoidCallback? onEditPhoto;

  @override
  Widget build(BuildContext context) {
    final image = photo != null && photo!.existsSync()
        ? Image.file(
            photo!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        : Image.asset('assets/images/person_icon.jpg', fit: BoxFit.cover);

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 128.r,
              height: 128.r,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: context.colors.primary, width: 2),
              ),
              child: ClipOval(child: image),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: onEditPhoto,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.primary, width: 2),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 16.r,
                    color: context.colors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(20.h),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.profileName(context),
        ),
        Gap(4.h),
        Text(
          email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.profileEmail(context),
        ),
      ],
    );
  }
}
