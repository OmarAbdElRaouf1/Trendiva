import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/validators.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_button_click.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_otp_text.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_otp_text_button.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/auth_timer.dart';

class OtpScreenArgs {
  const OtpScreenArgs({
    required this.email,
    required this.purpose,
    this.sendOnOpen = false,
  });

  final String email;
  final OtpPurpose purpose;

  final bool sendOnOpen;
}

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.args});

  final OtpScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: OtpVerificationBody(args: args),
    );
  }
}

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({super.key, required this.args});

  final OtpScreenArgs args;

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody> {
  final _timerKey = GlobalKey<AuthTimerState>();
  String _code = '';

  @override
  void initState() {
    super.initState();
    if (widget.args.sendOnOpen) {
      _resend(context);
    }
  }

  void _verify(BuildContext context) {
    FocusScope.of(context).unfocus();
    final error = Validators.otp(_code);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    context.read<AuthCubit>().verifyOtp(
      email: widget.args.email,
      otp: _code,
      purpose: widget.args.purpose,
    );
  }

  void _resend(BuildContext context) {
    context.read<AuthCubit>().resendOtp(email: widget.args.email);
    _timerKey.currentState?.restart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpVerified) {
          if (widget.args.purpose == OtpPurpose.resetPassword) {
            if (state.message != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }
            Navigator.of(context).pushNamed(
              Routes.changePasswordView,
              arguments: {'email': widget.args.email, 'otp': _code},
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? 'Email verified! Please log in.',
                ),
              ),
            );
            context.pushAndRemoveUntil(Routes.loginView);
          }
        } else if (state is AuthCodeSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'A new code has been sent.'),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                    color: context.colors.surface,
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

                      AuthOtpTextButton(
                        onCodeChanged: (code) => _code = code,
                        onSubmit: (code) {
                          _code = code;
                          _verify(context);
                        },
                      ),

                      const SizedBox(height: 36),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return AuthButtonClick(
                              text: isLoading ? 'Verifying...' : 'Verify',
                              onPressed: isLoading
                                  ? () {}
                                  : () => _verify(context),
                              icon: Icons.arrow_forward_ios,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive a code? ",
                            style: TextStyle(
                              color: context.colors.textMuted,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _resend(context),
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                color: context.colors.heading,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      AuthTimer(
                        key: _timerKey,
                        onExpire: () => _resend(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
