import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class SupportItem extends StatelessWidget {
  const SupportItem({super.key, required this.icon, required this.title});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Gap(24.w),
            Text(title, style: AppTextStyles.profileItemTitle),
            const Spacer(),
            SvgPicture.asset('assets/icons/profile_icons/show.svg'),
          ],
        ),
      ),
    );
  }
}
