import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/preference_item.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/profile_section.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/profile_stats.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/support_item.dart';

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
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileStats(numOfStats: '12', textOfStats: 'ORDERS'),
                SizedBox(width: 16),
                ProfileStats(numOfStats: '08', textOfStats: 'WISHLIST'),
                SizedBox(width: 16),
                ProfileStats(numOfStats: '24', textOfStats: 'REVIEWS'),
              ],
            ),
            const SizedBox(height: 32),
            ProfileSection(
              title: 'PREFERENCES & ACCOUNT',
              children: [
                const PreferenceItem(
                  icon: 'assets/icons/profile_icons/acc_settings.svg',
                  title: 'Account Settings',
                  description: 'Change Password, Security',
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
            const SizedBox(height: 32),
            const ProfileSection(
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
                ),
                SupportItem(
                  icon: 'assets/icons/profile_icons/contact_us.svg',
                  title: 'Contact Us',
                ),
              ],
            ),
            const SizedBox(height: 8),
            const LogoutButton(),
            const SizedBox(height: 32),
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
