import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class AboutUsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AboutUsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back, size: 25.sp),
      ),
      title: const Text('Trendiva', style: AppTextStyles.profileAppBarTitle),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none, size: 25.sp),
        ),
      ],
    );
  }
}
