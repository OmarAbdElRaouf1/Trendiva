import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(
          color: const Color(0xFF004D40),
          width: 2,
        ),
      ),
      onChanged: onCodeChanged,
      onCompleted: onSubmit,
    );
  }
}