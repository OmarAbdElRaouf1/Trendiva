import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/utils/pref_helper.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: context.colors.errorBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () async {
          await PrefHelper.clearToken();
          if (context.mounted) {
            context.pushAndRemoveUntil(Routes.loginView);
          }
        },
        child: Row(
          children: [
            Gap(16.w),
            SvgPicture.asset('assets/icons/profile_icons/logout.svg'),
            Gap(24.w),
            Text('Logout', style: AppTextStyles.profileLogout(context)),
          ],
        ),
      ),
    );
  }
}
