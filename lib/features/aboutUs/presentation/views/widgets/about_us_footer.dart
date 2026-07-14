import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class AboutUsFooter extends StatelessWidget {
  const AboutUsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FOLLOW OUR JOURNEY', style: AppTextStyles.aboutFooterTag(context)),
        Gap(16.h),
        const Row(
          spacing: 32,
          children: [
            Icon(Icons.campaign_outlined),
            Icon(Icons.camera_alt_outlined),
            Icon(Icons.language),
          ],
        ),
        Gap(16.h),
        Text(
          '© 2024 Trendiva Fashion Group. All rights reserved.',
          style: AppTextStyles.aboutCopyright(context),
        ),
      ],
    );
  }
}
