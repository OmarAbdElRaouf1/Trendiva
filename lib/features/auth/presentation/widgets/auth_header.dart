import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
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
        Gap(14.h),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle,
        ),
        Gap(6.h),
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
        Gap(8.w),
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