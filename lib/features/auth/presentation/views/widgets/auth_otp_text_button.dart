import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class AuthOtpTextButton extends StatelessWidget {
  const AuthOtpTextButton({
    super.key,
    required this.onCodeChanged,
    required this.onSubmit,
  });

  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 60,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: context.colors.textPrimary,
      ),
      decoration: BoxDecoration(
        color: context.colors.chip,
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(
          color: context.colors.primary,
          width: 2,
        ),
      ),
      onChanged: onCodeChanged,
      onCompleted: onSubmit,
    );
  }
}