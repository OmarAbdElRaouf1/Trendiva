import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_card.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/auth_switch_text.dart';
import '../widgets/auth_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              children: [
                Gap(30.h),
                AuthCard(
                  children: [
                    const AuthHeader.login(),
                    Gap(36.h),
                    AuthTextField(
                      label: 'Email Address',
                      hint: 'name@example.com',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(18.h),
                    AuthPasswordField(
                      label: 'Password',
                      hint: '••••••••',
                      controller: passwordController,
                      prefixIcon: Icons.lock_outline,
                      obscureText: hidePassword,
                      labelTrailing: InkWell(
                        onTap: () =>
                            context.pushNamed(Routes.forgetPasswordView),
                        child: Text(
                          'Forgot Password?',
                          style: AppTextStyles.authLink.copyWith(fontSize: 11),
                        ),
                      ),
                      onToggle: () =>
                          setState(() => hidePassword = !hidePassword),
                    ),
                    Gap(24.h),
                    AuthButton(
                      text: 'Login',
                      onPressed: () {
                        context.pushAndRemoveUntil(Routes.rootView);
                      },
                    ),
                    Gap(70.h),
                    AuthSwitchText(
                      normalText: 'New to Trendiva? ',
                      actionText: 'Sign Up',
                      onTap: () => context.pushNamed(Routes.signupView),
                    ),
                  ],
                ),
                Gap(28.h),
                const Text(
                  '© 2024 Trendiva Fashion. All rights reserved.',
                  style: TextStyle(fontSize: 11, color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
