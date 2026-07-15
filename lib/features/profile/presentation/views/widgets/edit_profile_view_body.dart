import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/widgets/custom_button.dart';
import 'package:trendiva/core/widgets/custom_text_field.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_password_field.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_state.dart';

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

    await context.read<ProfileCubit>().updateProfile(name: name, email: email);
    if (!mounted) return;
    context.pop();
    showMessage('Profile updated successfully');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(24.h),
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
