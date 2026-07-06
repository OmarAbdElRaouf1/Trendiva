import 'package:flutter/material.dart';
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
                const SizedBox(height: 44),
                Text('Join the\nmovement.', style: AppTextStyles.authBigTitle),
                const SizedBox(height: 10),
                Text(
                  'Discover the pinnacle of sophisticated fashion\nand effortless luxury.',
                  style: AppTextStyles.authSubtitle,
                ),
                const SizedBox(height: 28),
                AuthTextField(
                  label: 'Full Name',
                  hint: 'Alexander McQueen',
                  controller: nameController,
                  verticalPadding: 17,
                ),
                const SizedBox(height: 18),
                AuthTextField(
                  label: 'Email',
                  hint: 'alex@trendiva.com',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  verticalPadding: 17,
                ),
                const SizedBox(height: 18),
                AuthPasswordField(
                  label: 'Password',
                  hint: '••••••••',
                  controller: passwordController,
                  obscureText: hidePassword,
                  verticalPadding: 17,
                  onToggle: () => setState(() => hidePassword = !hidePassword),
                ),
                const SizedBox(height: 18),
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
                const SizedBox(height: 18),
                TermsCheckbox(
                  value: agree,
                  onChanged: (value) => setState(() => agree = value ?? false),
                ),
                const SizedBox(height: 28),
                AuthButton(
                  text: 'Create Account',
                  onPressed: () {},
                  icon: Icons.arrow_forward,
                  height: 54,
                  shadowAlpha: 0.25,
                ),
                const SizedBox(height: 24),
                AuthSwitchText(
                  normalText: 'Already have an account? ',
                  actionText: 'Log In',
                  onTap: () => context.pop(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
