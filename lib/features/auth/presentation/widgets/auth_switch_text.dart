import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class AuthSwitchText extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onTap;

  const AuthSwitchText({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: AppTextStyles.authSmallText.copyWith(fontSize: 14),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.authLink,
          ),
        ),
      ],
    );
  }
}