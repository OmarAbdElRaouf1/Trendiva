import 'package:flutter/material.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

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

  static const String logoPath = 'assets/images/trendiva_logo.png';

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
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(
                      logoPath,
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Trendiva',
                    style: AppTextStyles.authLogoTitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),
              Text(
                'Join the\nmovement.',
                style: AppTextStyles.authBigTitle,
              ),
              const SizedBox(height: 10),
              Text(
                'Discover the pinnacle of sophisticated fashion\nand effortless luxury.',
                style: AppTextStyles.authSubtitle,
              ),
              const SizedBox(height: 28),
              Text(
                'Full Name',
                style: AppTextStyles.authLabel,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: inputDecoration(
                  hint: 'Alexander McQueen',
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Email',
                style: AppTextStyles.authLabel,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration(
                  hint: 'alex@trendiva.com',
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Password',
                style: AppTextStyles.authLabel,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: inputDecoration(
                  hint: '••••••••',
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Confirm Password',
                style: AppTextStyles.authLabel,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPasswordController,
                obscureText: hideConfirmPassword,
                decoration: inputDecoration(
                  hint: '••••••••',
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: agree,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.authSmallText.copyWith(
                          fontSize: 12,
                          height: 1.4,
                        ),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: AppTextStyles.authLink.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ' and Privacy\nPolicy'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    elevation: 4,
                    shadowColor: AppColors.primaryColor.withValues(alpha: 0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: AppTextStyles.authButton,
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyles.authSmallText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginView,
                      );
                    },
                    child: Text(
                      'Log In',
                      style: AppTextStyles.authLink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.authFieldColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.authHint,
    );
  }
}
