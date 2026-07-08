import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class AuthOtpTextButton extends StatelessWidget {
  const AuthOtpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      fieldWidth: 56,
      fieldHeight: 70,
      borderColor: Colors.transparent,
      focusedBorderColor: Color(0xFF004D40),
      enabledBorderColor: Colors.transparent,
      disabledBorderColor: Colors.transparent,
      fillColor: Color(0xF9F5F5F5),
      filled: true,
      borderRadius: BorderRadius.circular(
        16,
      ),   
      showFieldAsBox: true,
      borderWidth: 1.5,
      cursorColor: Color(0xFF004D40),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      onCodeChanged: (String code) {
      },
      onSubmit: (String verificationCode) {
        print("OTP Code is: $verificationCode");
      },
    );
  }
}
