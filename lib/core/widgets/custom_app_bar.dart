import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/app_bar_icons/options.svg'),
      ),
      title: Text('Trendiva', style: AppTextStyles.profileAppBarTitle(context)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/app_bar_icons/notification.svg'),
        ),
      ],
    );
  }
}
