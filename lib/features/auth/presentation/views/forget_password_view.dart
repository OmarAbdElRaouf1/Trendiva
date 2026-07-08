import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_button_click.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_button_icon.dart';
import 'package:nti_final_project/core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AuthAppBar(),
              Gap(40.h),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004333),
                      ),
                    ),
                    Gap(10.h),
                    const Text(
                      'No worries! Enter the email address associated with your account and we\'ll send a link to reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff3F4945), height: 1.4),
                    ),
                    Gap(30.h),
                    // Enter Email
                    CustomTextField(
                      label: 'Email Address',
                      hint: 'name@example.com',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(24.h),
                    // submitButton
                    AuthButtonClick(
                      text: 'Send Reset Link',
                      onPressed: () {
                        context.pushNamed(Routes.otpView);
                      },
                      icon: Icons.arrow_forward,
                    ),
                    Gap(20.h),
                    //backButton
                    AuthButtonIcon(
                      text: 'Back to Login',
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icons.arrow_back,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
