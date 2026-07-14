import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

/// A titled section with a rounded card that separates
/// its [children] with dividers.
class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.children,
    this.titleSpacing = 16,
  });

  final String title;
  final List<Widget> children;
  final double titleSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.profileSectionTitle(context)),
        Gap(titleSpacing.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: context.colors.surface,
          ),
          child: Column(children: _childrenWithDividers(context)),
        ),
      ],
    );
  }

  List<Widget> _childrenWithDividers(BuildContext context) {
    final divider = Divider(
      color: context.colors.divider,
      indent: 15,
      endIndent: 15,
    );
    return [
      for (int i = 0; i < children.length; i++) ...[
        if (i > 0) divider,
        children[i],
      ],
    ];
  }
}
