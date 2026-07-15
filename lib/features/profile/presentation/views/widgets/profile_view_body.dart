import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/theme/theme_cubit.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/widgets/retry_button.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_state.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/preference_item.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_section.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_skeleton.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_stats.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/support_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  Future<void> _pickPhoto(BuildContext context, ImageSource source) async {
    final cubit = context.read<ProfileCubit>();
    try {
      final photo = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        imageQuality: 85,
      );
      if (photo == null) return;
      await cubit.updatePhoto(File(photo.path));
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Profile photo updated')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open the ${source.name}')),
        );
      }
    }
  }

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(12.h),
            Text('Change Photo', style: AppTextStyles.profileItemTitle(context)),
            Gap(8.h),
            ListTile(
              leading: Icon(
                Icons.photo_camera_outlined,
                color: context.colors.heading,
              ),
              title: Text(
                'Take Photo',
                style: AppTextStyles.profileItemTitle(context),
              ),
              onTap: () {
                sheetContext.pop();
                _pickPhoto(context, ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library_outlined,
                color: context.colors.heading,
              ),
              title: Text(
                'Choose from Gallery',
                style: AppTextStyles.profileItemTitle(context),
              ),
              onTap: () {
                sheetContext.pop();
                _pickPhoto(context, ImageSource.gallery);
              },
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Gap(8.h),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return switch (state) {
                  ProfileInitial() || ProfileLoading() => const ProfileSkeleton(),
                  ProfileError(:final message) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: RetryButton(message: 'Failed to load profile: $message'),
                  ),
                  ProfileLoaded(:final name, :final email, :final photo) =>
                    ProfileHeader(
                      name: name,
                      email: email,
                      photo: photo,
                      onEditPhoto: () => _showPhotoOptions(context),
                    ),
                };
              },
            ),
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
                  description: 'Edit Name, Password',
                  onTap: () {
                    context.pushNamed(
                      Routes.editProfileView,
                      arguments: context.read<ProfileCubit>(),
                    );
                  },
                ),
                PreferenceItem(
                  icon: 'assets/icons/profile_icons/theme.svg',
                  title: 'App Theme',
                  description: 'Switch between Light/Dark',
                  trailing: BlocBuilder<ThemeCubit, ThemeMode>(
                    builder: (context, mode) {
                      return Switch(
                        value: mode == ThemeMode.dark,
                        onChanged: (_) =>
                            context.read<ThemeCubit>().toggleTheme(),
                      );
                    },
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
                  onTap: () {
                    context.pushNamed(Routes.helpCenterView);
                  },
                ),
                SupportItem(
                  icon: 'assets/icons/profile_icons/privacy_policy.svg',
                  title: 'Privacy Policy',
                  onTap: () {
                    context.pushNamed(Routes.privacyPolicyView);
                  },
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
                  onTap: () {
                    context.pushNamed(Routes.contactUsView);
                  },
                ),
              ],
            ),
            Gap(8.h),
            const LogoutButton(),
            Gap(32.h),
            Text(
              'Trendiva Version 2.4.0 (Emerald Build)',
              style: AppTextStyles.profileVersion(context),
            ),
            Gap(120.h),
          ],
        ),
      ),
    );
  }
}
