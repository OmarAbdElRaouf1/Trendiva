import 'package:flutter/material.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'auth_widgets.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            children: [
              gap(30),
              card([
                logo(),
                gap(14),
                Text('Trendiva', style: AppTextStyles.authLogoTitle),
                gap(6),
                Text(
                  'Curating your sophisticated style.',
                  style: AppTextStyles.authSmallText,
                ),
                gap(36),
                field(
                  label: 'Email Address',
                  hint: 'name@example.com',
                  controller: emailController,
                  icon: Icons.email_outlined,
                  type: TextInputType.emailAddress,
                ),
                gap(18),
                field(
                  label: 'Password',
                  hint: '••••••••',
                  controller: passwordController,
                  icon: Icons.lock_outline,
                  hide: hidePassword,
                  end: Text(
                    'Forgot Password?',
                    style: AppTextStyles.authLink.copyWith(fontSize: 11),
                  ),
                  suffix: eye(
                    hidePassword,
                    () => setState(() {
                      hidePassword = !hidePassword;
                    }),
                  ),
                ),
                gap(24),
                authButton(
                  text: 'Login',
                  onTap: () {},
                ),
                gap(70),
                switchText(
                  'New to Trendiva? ',
                  'Sign Up',
                  () => Navigator.pushNamed(context, Routes.signupView),
                ),
              ]),
              gap(28),
              const Text(
                '© 2024 Trendiva Fashion. All rights reserved.',
                style: TextStyle(fontSize: 11, color: Colors.black38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}