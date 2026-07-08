import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/preference_item.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_section.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_stats.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/support_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const ProfileHeader(),
            Gap(32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ProfileStats(numOfStats: '12', textOfStats: 'ORDERS'),
                Gap(16.w),
                const ProfileStats(numOfStats: '08', textOfStats: 'WISHLIST'),
                Gap(16.w),
                const ProfileStats(numOfStats: '24', textOfStats: 'REVIEWS'),
              ],
            ),
            Gap(32.h),
            ProfileSection(
              title: 'PREFERENCES & ACCOUNT',
              children: [
                PreferenceItem(
                  icon: 'assets/icons/profile_icons/acc_settings.svg',
                  title: 'Account Settings',
                  description: 'Change Password, Security',
                  onTap: () {
                    context.pushNamed(Routes.changePasswordView);
                  },
                ),
                PreferenceItem(
                  icon: 'assets/icons/profile_icons/theme.svg',
                  title: 'App Theme',
                  description: 'Switch between Light/Dark',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                    activeThumbColor: AppColors.darkGreenColor,
                  ),
                ),
              ],
            ),
            Gap(32.h),
            ProfileSection(
              title: 'SUPPORT',
              titleSpacing: 8,
              children: [
                SupportItem(
                  icon: 'assets/icons/profile_icons/help_center.svg',
                  title: 'Help Center',
                ),
                SupportItem(
                  icon: 'assets/icons/profile_icons/privacy_policy.svg',
                  title: 'Privacy Policy',
                ),
                SupportItem(
                  icon: 'assets/icons/profile_icons/about_us.svg',
                  title: 'About Us',
                  onTap: () {
                    context.pushNamed(Routes.aboutUsView);
                  },
                ),
                SupportItem(
                  icon: 'assets/icons/profile_icons/contact_us.svg',
                  title: 'Contact Us',
                ),
              ],
            ),
            Gap(8.h),
            const LogoutButton(),
            Gap(32.h),
            const Text(
              'Trendiva Version 2.4.0 (Emerald Build)',
              style: AppTextStyles.profileVersion,
            ),
            Gap(120.h),
          ],
        ),
      ),
    );
  }
}
