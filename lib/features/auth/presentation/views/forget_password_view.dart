import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/validators.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_button_click.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_button_icon.dart';
import 'package:trendiva/core/widgets/custom_text_field.dart';
import 'otp_screen.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: const _ForgetPasswordViewBody(),
    );
  }
}

class _ForgetPasswordViewBody extends StatefulWidget {
  const _ForgetPasswordViewBody();

  @override
  State<_ForgetPasswordViewBody> createState() =>
      _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<_ForgetPasswordViewBody> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    final error = Validators.email(emailController.text);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    context.read<AuthCubit>().forgotPassword(
      email: emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCodeSent) {
          if (state.message != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message!)));
          }
          context.pushNamed(
            Routes.otpView,
            arguments: OtpScreenArgs(
              email: emailController.text.trim(),
              purpose: OtpPurpose.resetPassword,
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                    color: context.colors.surface,
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
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: context.colors.heading,
                        ),
                      ),
                      Gap(10.h),
                      Text(
                        'No worries! Enter the email address associated with your account and we\'ll send a link to reset your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: context.colors.textSecondary, height: 1.4),
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
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoading;
                          return AuthButtonClick(
                            text: isLoading ? 'Sending...' : 'Send Reset Link',
                            onPressed: isLoading
                                ? () {}
                                : () => _submit(context),
                            icon: Icons.arrow_forward,
                          );
                        },
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
      ),
    );
  }
}
