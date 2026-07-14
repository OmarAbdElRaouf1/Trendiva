import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/widgets/custom_button.dart';
import 'package:trendiva/core/widgets/custom_text_field.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_state.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/edit_profile_avatar.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  XFile? pickedPhoto;

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileCubit>().state;
    nameController = TextEditingController(
      text: state is ProfileLoaded ? state.name : '',
    );
    emailController = TextEditingController(
      text: state is ProfileLoaded ? state.email : '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> pickPhoto(ImageSource source) async {
    try {
      final photo = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        imageQuality: 85,
      );
      if (photo != null) {
        setState(() => pickedPhoto = photo);
      }
    } catch (_) {
      if (mounted) {
        showMessage('Could not open the ${source.name}', isError: true);
      }
    }
  }

  void showPhotoOptions() {
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
                pickPhoto(ImageSource.camera);
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
                pickPhoto(ImageSource.gallery);
              },
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }

  void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError
            ? context.colors.error
            : context.colors.heading,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> saveChanges() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty) {
      showMessage('Please enter your name', isError: true);
      return;
    }
    if (email.isEmpty || !email.contains('@')) {
      showMessage('Please enter a valid email', isError: true);
      return;
    }
    if (newPassword.isNotEmpty || confirmPassword.isNotEmpty) {
      if (newPassword.length < 8) {
        showMessage('Password must be at least 8 characters', isError: true);
        return;
      }
      if (newPassword != confirmPassword) {
        showMessage('Passwords do not match', isError: true);
        return;
      }
    }

    await context.read<ProfileCubit>().updateProfile(
      name: name,
      email: email,
      newPhoto: pickedPhoto == null ? null : File(pickedPhoto!.path),
    );
    if (!mounted) return;
    context.pop();
    showMessage('Profile updated successfully');
  }

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileCubit>().state;
    final currentPhoto = profileState is ProfileLoaded
        ? profileState.photo
        : null;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(24.h),
            Center(
              child: EditProfileAvatar(
                pickedPhoto: pickedPhoto,
                currentPhoto: currentPhoto,
                onTap: showPhotoOptions,
              ),
            ),
            Gap(8.h),
            Center(
              child: Text(
                'Tap the photo to change it',
                style: AppTextStyles.profileItemDescription(context),
              ),
            ),
            Gap(32.h),
            CustomTextField(
              label: 'Full Name',
              hint: 'Your name',
              controller: nameController,
              prefixIcon: Icons.person_outline,
            ),
            Gap(16.h),
            CustomTextField(
              label: 'Email',
              hint: 'you@trendiva.com',
              controller: emailController,
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(32.h),
            Text(
              'CHANGE PASSWORD',
              style: AppTextStyles.profileSectionTitle(context),
            ),
            Gap(4.h),
            Text(
              'Leave empty to keep your current password.',
              style: AppTextStyles.profileItemDescription(context),
            ),
            Gap(16.h),
            AuthPasswordField(
              label: 'New Password',
              hint: '••••••••',
              controller: newPasswordController,
              obscureText: isNewPasswordHidden,
              onToggle: () {
                setState(() {
                  isNewPasswordHidden = !isNewPasswordHidden;
                });
              },
            ),
            Gap(16.h),
            AuthPasswordField(
              label: 'Confirm New Password',
              hint: '••••••••',
              controller: confirmPasswordController,
              obscureText: isConfirmPasswordHidden,
              onToggle: () {
                setState(() {
                  isConfirmPasswordHidden = !isConfirmPasswordHidden;
                });
              },
            ),
            Gap(40.h),
            CustomButton(
              text: 'Save Changes',
              icon: Icons.check,
              onPressed: saveChanges,
            ),
            Gap(24.h),
          ],
        ),
      ),
    );
  }
}
