import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/core/widgets/custom_button.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/password_requirements_card.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/password_strength.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/success_dialog.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(32.h),
            const Text(
              'Create New Password',
              style: AppTextStyles.changePasswordTitle,
            ),
            Gap(4.h),
            const Text(
              'Your new password must be different from previous used '
              'passwords.',
              style: AppTextStyles.changePasswordSubtitle,
            ),
            Gap(24.h),
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
            Gap(12.h),
            const PasswordStrength(),
            Gap(24.h),
            AuthPasswordField(
              label: 'Confirm Password',
              hint: '••••••••',
              controller: confirmPasswordController,
              obscureText: isConfirmPasswordHidden,
              onToggle: () {
                setState(() {
                  isConfirmPasswordHidden = !isConfirmPasswordHidden;
                });
              },
            ),
            Gap(24.h),
            const PasswordRequirementsCard(),
            Gap(48.h),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const SuccessDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
