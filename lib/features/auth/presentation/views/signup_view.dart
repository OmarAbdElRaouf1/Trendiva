import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/auth_switch_text.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/terms_checkbox.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agree = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.authBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader.signup(),
                Gap(44.h),
                Text('Join the\nmovement.', style: AppTextStyles.authBigTitle),
                Gap(10.h),
                Text(
                  'Discover the pinnacle of sophisticated fashion\nand effortless luxury.',
                  style: AppTextStyles.authSubtitle,
                ),
                Gap(28.h),
                AuthTextField(
                  label: 'Full Name',
                  hint: 'Alexander McQueen',
                  controller: nameController,
                  verticalPadding: 17,
                ),
                Gap(18.h),
                AuthTextField(
                  label: 'Email',
                  hint: 'alex@trendiva.com',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  verticalPadding: 17,
                ),
                Gap(18.h),
                AuthPasswordField(
                  label: 'Password',
                  hint: '••••••••',
                  controller: passwordController,
                  obscureText: hidePassword,
                  verticalPadding: 17,
                  onToggle: () => setState(() => hidePassword = !hidePassword),
                ),
                Gap(18.h),
                AuthPasswordField(
                  label: 'Confirm Password',
                  hint: '••••••••',
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  verticalPadding: 17,
                  onToggle: () => setState(
                    () => hideConfirmPassword = !hideConfirmPassword,
                  ),
                ),
                Gap(18.h),
                TermsCheckbox(
                  value: agree,
                  onChanged: (value) => setState(() => agree = value ?? false),
                ),
                Gap(28.h),
                AuthButton(
                  text: 'Create Account',
                  onPressed: () {},
                  icon: Icons.arrow_forward,
                  height: 54,
                  shadowAlpha: 0.25,
                ),
                Gap(24.h),
                AuthSwitchText(
                  normalText: 'Already have an account? ',
                  actionText: 'Log In',
                  onTap: () => context.pop(),
                ),
                Gap(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
