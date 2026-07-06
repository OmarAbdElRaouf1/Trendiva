import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.trailing,
  });

  final String icon;
  final String title;
  final String description;

  /// Shown at the end of the row; defaults to the chevron icon.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Gap(24.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.profileItemTitle),
              Text(description, style: AppTextStyles.profileItemDescription),
            ],
          ),
          const Spacer(),
          trailing ?? SvgPicture.asset('assets/icons/profile_icons/show.svg'),
        ],
      ),
    );
  }
}
