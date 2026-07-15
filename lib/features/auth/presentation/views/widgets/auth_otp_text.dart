import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class AuthOtpText extends StatelessWidget {
  const AuthOtpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.colors.chipTint,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.mark_email_unread_outlined,
            size: 40,
            color: context.colors.primary,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Check your mail',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Enter the 6-digit code sent to your\nemail.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: context.colors.textMuted,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
