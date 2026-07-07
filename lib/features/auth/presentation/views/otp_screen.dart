import 'package:flutter/material.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_button_click.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_otp_text.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_otp_text_button.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_timer.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF9F5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF004D40)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Trendiva',
          style: TextStyle(
            color: Color(0xFF004D40),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthOtpText(),
                const SizedBox(height: 32),
                //AuthOtpTextButton
                AuthOtpTextButton(),

                const SizedBox(height: 36),

                // AuthButtonClick(Verify)
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: AuthButtonClick(
                    text: 'Verify',
                    onPressed: () {},
                    icon: Icons.arrow_forward_ios,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive a code? ",
                      style: TextStyle(color: Color(0xff5D5F5C), fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          color: Color(0xff00342B),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AuthTimer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
