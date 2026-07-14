import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/utils/validators.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';
import 'otp_screen.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/auth_switch_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/terms_checkbox.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: const _SignupViewBody(),
    );
  }
}

class _SignupViewBody extends StatefulWidget {
  const _SignupViewBody();

  @override
  State<_SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<_SignupViewBody> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agree = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    final error =
        Validators.name(nameController.text) ??
        Validators.email(emailController.text) ??
        Validators.password(passwordController.text) ??
        Validators.confirmPassword(
          passwordController.text,
          confirmPasswordController.text,
        );
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    if (!agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the Terms & Conditions.'),
        ),
      );
      return;
    }
    final nameParts = nameController.text.trim().split(RegExp(r'\s+'));
    final firstName = nameParts.first;
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : firstName;
    context.read<AuthCubit>().signup(
      firstName: firstName,
      lastName: lastName,
      email: emailController.text.trim(),
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedUp) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created. Verify your email to continue.'),
            ),
          );
          context.pushNamed(
            Routes.otpView,
            arguments: OtpScreenArgs(
              email: emailController.text.trim(),
              purpose: OtpPurpose.verifyEmail,
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader.signup(),
                  Gap(44.h),
                  Text(
                    'Join the\nmovement.',
                    style: AppTextStyles.authBigTitle(context),
                  ),
                  Gap(10.h),
                  Text(
                    'Discover the pinnacle of sophisticated fashion\nand effortless luxury.',
                    style: AppTextStyles.authSubtitle(context),
                  ),
                  Gap(28.h),
                  CustomTextField(
                    label: 'Full Name',
                    hint: 'Alexander McQueen',
                    controller: nameController,
                    verticalPadding: 17,
                  ),
                  Gap(18.h),
                  CustomTextField(
                    label: 'Email',
                    hint: 'alex@trendiva.com',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    verticalPadding: 17,
                  ),
                  Gap(18.h),
                  AuthPasswordField(
                    label: 'Password',
                    hint: '••••••••',
                    controller: passwordController,
                    obscureText: hidePassword,
                    verticalPadding: 17,
                    onToggle: () =>
                        setState(() => hidePassword = !hidePassword),
                  ),
                  Gap(18.h),
                  AuthPasswordField(
                    label: 'Confirm Password',
                    hint: '••••••••',
                    controller: confirmPasswordController,
                    obscureText: hideConfirmPassword,
                    verticalPadding: 17,
                    onToggle: () => setState(
                      () => hideConfirmPassword = !hideConfirmPassword,
                    ),
                  ),
                  Gap(18.h),
                  TermsCheckbox(
                    value: agree,
                    onChanged: (value) =>
                        setState(() => agree = value ?? false),
                  ),
                  Gap(28.h),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return CustomButton(
                        text: isLoading
                            ? 'Creating account...'
                            : 'Create Account',
                        onPressed: isLoading ? () {} : () => _submit(context),
                        icon: isLoading ? null : Icons.arrow_forward,
                        height: 54,
                        shadowAlpha: 0.25,
                      );
                    },
                  ),
                  Gap(24.h),
                  AuthSwitchText(
                    normalText: 'Already have an account? ',
                    actionText: 'Log In',
                    onTap: () => context.pop(),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
