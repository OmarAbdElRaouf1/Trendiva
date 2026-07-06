import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.profileBackgroundColor,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/app_bar_icons/options.svg'),
      ),
      title: const Text('Trendiva', style: AppTextStyles.profileAppBarTitle),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/app_bar_icons/notification.svg'),
        ),
      ],
    );
  }
}
