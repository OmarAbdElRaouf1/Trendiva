import 'package:flutter/material.dart';
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
                const SizedBox(height: 30),
                AuthCard(
                  children: [
                    const AuthHeader.login(),
                    const SizedBox(height: 36),
                    AuthTextField(
                      label: 'Email Address',
                      hint: 'name@example.com',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 18),
                    AuthPasswordField(
                      label: 'Password',
                      hint: '••••••••',
                      controller: passwordController,
                      prefixIcon: Icons.lock_outline,
                      obscureText: hidePassword,
                      labelTrailing: Text(
                        'Forgot Password?',
                        style: AppTextStyles.authLink.copyWith(fontSize: 11),
                      ),
                      onToggle: () =>
                          setState(() => hidePassword = !hidePassword),
                    ),
                    const SizedBox(height: 24),
                    AuthButton(
                      text: 'Login',
                      onPressed: () {
                        context.pushAndRemoveUntil(Routes.rootView);
                      },
                    ),
                    const SizedBox(height: 70),
                    AuthSwitchText(
                      normalText: 'New to Trendiva? ',
                      actionText: 'Sign Up',
                      onTap: () => context.pushNamed(Routes.signupView),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
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
