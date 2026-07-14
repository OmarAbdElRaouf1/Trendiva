import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/utils/validators.dart';
import 'package:trendiva/core/widgets/custom_button.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:trendiva/features/auth/presentation/widgets/password_requirements_card.dart';
import 'package:trendiva/features/auth/presentation/widgets/password_strength.dart';
import 'package:trendiva/features/auth/presentation/widgets/success_dialog.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({
    super.key,
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  State<ChangePasswordViewBody> createState() =>
      _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    newPasswordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    final error =
        Validators.password(newPasswordController.text) ??
        Validators.confirmPassword(
          newPasswordController.text,
          confirmPasswordController.text,
        );
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    context.read<AuthCubit>().resetPassword(
      email: widget.email,
      otp: widget.otp,
      newPassword: newPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthPasswordReset) {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                SuccessDialog(message: state.message),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(32.h),
              Text(
                'Create New Password',
                style: AppTextStyles.changePasswordTitle(context),
              ),
              Gap(4.h),
              Text(
                'Your new password must be different from previous used '
                'passwords.',
                style: AppTextStyles.changePasswordSubtitle(context),
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
              PasswordStrength(password: newPasswordController.text),
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
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final isLoading = state is AuthLoading;
                  return CustomButton(
                    text: isLoading ? 'Resetting...' : 'Reset Password',
                    onPressed: isLoading ? () {} : () => _submit(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
