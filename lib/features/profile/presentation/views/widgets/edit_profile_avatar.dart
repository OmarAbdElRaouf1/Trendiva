import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_colors.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({
    super.key,
    required this.pickedPhoto,
    required this.currentPhoto,
    required this.onTap,
  });

  final XFile? pickedPhoto;
  final File? currentPhoto;
  final VoidCallback onTap;

  ImageProvider get photoImage {
    if (pickedPhoto != null) {
      return FileImage(File(pickedPhoto!.path));
    }
    if (currentPhoto != null) {
      return FileImage(currentPhoto!);
    }
    return const AssetImage('assets/photos/profile_photo.png');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colors.primary, width: 2),
        ),
        child: Stack(
          children: [
            CircleAvatar(radius: 64, backgroundImage: photoImage),
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
                child: Icon(
                  Icons.photo_camera_outlined,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
