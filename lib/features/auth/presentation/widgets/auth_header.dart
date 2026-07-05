import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'auth_logo.dart';

class AuthHeader extends StatelessWidget {
  final bool isLogin;

  const AuthHeader.login({super.key}) : isLogin = true;

  const AuthHeader.signup({super.key}) : isLogin = false;

  @override
  Widget build(BuildContext context) {
    return isLogin ? _loginHeader() : _signupHeader();
  }

  Widget _loginHeader() {
    return Column(
      children: [
        const AuthLogo(size: 58, radius: 16),
        const SizedBox(height: 14),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle,
        ),
        const SizedBox(height: 6),
        Text(
          'Curating your sophisticated style.',
          style: AppTextStyles.authSmallText,
        ),
      ],
    );
  }

  Widget _signupHeader() {
    return Row(
      children: [
        const AuthLogo(size: 32, radius: 9),
        const SizedBox(width: 8),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}