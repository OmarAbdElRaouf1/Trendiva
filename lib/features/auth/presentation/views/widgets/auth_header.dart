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
    return isLogin ? _loginHeader(context) : _signupHeader(context);
  }

  Widget _loginHeader(BuildContext context) {
    return Column(
      children: [
        const AuthLogo(size: 58, radius: 16),
        Gap(14.h),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle(context),
        ),
        Gap(6.h),
        Text(
          'Curating your sophisticated style.',
          style: AppTextStyles.authSmallText(context),
        ),
      ],
    );
  }

  Widget _signupHeader(BuildContext context) {
    return Row(
      children: [
        const AuthLogo(size: 32, radius: 9),
        Gap(8.w),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle(context).copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
