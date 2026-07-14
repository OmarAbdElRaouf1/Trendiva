import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/utils/validators.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/auth_card.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/auth_switch_text.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: const _LoginViewBody(),
    );
  }
}

class _LoginViewBody extends StatefulWidget {
  const _LoginViewBody();

  @override
  State<_LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<_LoginViewBody> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    final error =
        Validators.email(emailController.text) ??
        Validators.password(passwordController.text);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    context.read<AuthCubit>().login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          context.pushAndRemoveUntil(Routes.rootView);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 28,
              ),
              child: Column(
                children: [
                  Gap(30.h),
                  AuthCard(
                    children: [
                      const AuthHeader.login(),
                      Gap(36.h),
                      CustomTextField(
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
                            style: AppTextStyles.authLink(context).copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        onToggle: () =>
                            setState(() => hidePassword = !hidePassword),
                      ),
                      Gap(24.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoading;
                          return CustomButton(
                            text: isLoading ? 'Logging in...' : 'Login',
                            onPressed: isLoading
                                ? () {}
                                : () => _submit(context),
                          );
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
                  Text(
                    '© 2024 Trendiva Fashion. All rights reserved.',
                    style: TextStyle(fontSize: 11, color: context.colors.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
