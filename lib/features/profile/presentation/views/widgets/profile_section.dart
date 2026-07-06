import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

/// A titled section with a white rounded card that separates
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
        Text(title, style: AppTextStyles.profileSectionTitle),
        SizedBox(height: titleSpacing),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
          ),
          child: Column(children: _childrenWithDividers()),
        ),
      ],
    );
  }

  List<Widget> _childrenWithDividers() {
    const divider = Divider(
      color: AppColors.dividerColor,
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
