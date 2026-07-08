import 'package:flutter/material.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_button_click.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_otp_text.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_otp_text_button.dart';
import 'package:trendiva/features/auth/presentation/widgets/auth_timer.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Header
              const AuthAppBar(),

              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AuthOtpText(),

                    const SizedBox(height: 32),

                    const AuthOtpTextButton(),

                    const SizedBox(height: 36),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: AuthButtonClick(
                        text: 'Verify',
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.changePasswordView);
                        },
                        icon: Icons.arrow_forward_ios,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive a code? ",
                          style: TextStyle(
                            color: Color(0xff5D5F5C),
                            fontSize: 14,
                          ),
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

                    const AuthTimer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
