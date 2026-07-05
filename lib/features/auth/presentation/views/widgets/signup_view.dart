import 'package:flutter/material.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'auth_widgets.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              brand(),
              gap(44),
              Text('Join the\nmovement.', style: AppTextStyles.authBigTitle),
              gap(10),
              Text(
                'Discover the pinnacle of sophisticated fashion\nand effortless luxury.',
                style: AppTextStyles.authSubtitle,
              ),
              gap(28),
              field(
                label: 'Full Name',
                hint: 'Alexander McQueen',
                controller: nameController,
                vertical: 17,
              ),
              gap(18),
              field(
                label: 'Email',
                hint: 'alex@trendiva.com',
                controller: emailController,
                type: TextInputType.emailAddress,
                vertical: 17,
              ),
              gap(18),
              field(
                label: 'Password',
                hint: '••••••••',
                controller: passwordController,
                hide: hidePassword,
                vertical: 17,
                suffix: eye(
                  hidePassword,
                  () => setState(() {
                    hidePassword = !hidePassword;
                  }),
                ),
              ),
              gap(18),
              field(
                label: 'Confirm Password',
                hint: '••••••••',
                controller: confirmPasswordController,
                hide: hideConfirmPassword,
                vertical: 17,
                suffix: eye(
                  hideConfirmPassword,
                  () => setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  }),
                ),
              ),
              gap(18),
              terms(
                agree,
                (value) => setState(() {
                  agree = value ?? false;
                }),
              ),
              gap(28),
              authButton(
                text: 'Create Account',
                onTap: () {},
                icon: Icons.arrow_forward,
                height: 54,
                alpha: 0.25,
              ),
              gap(24),
              switchText(
                'Already have an account? ',
                'Log In',
                () => Navigator.pushReplacementNamed(
                  context,
                  Routes.loginView,
                ),
              ),
              gap(20),
            ],
          ),
        ),
      ),
    );
  }
}