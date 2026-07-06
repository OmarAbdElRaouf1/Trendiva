import 'package:flutter/material.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_button_click.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_button_icon.dart';
import 'package:nti_final_project/features/auth/presentation/widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trendiva',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00342B),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.close), onPressed: () {}),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004333),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'No worries! Enter the email address associated with your account and we\'ll send a link to reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff3F4945), height: 1.4),
                    ),
                    const SizedBox(height: 30),
                    // Enter Email
                    AuthTextField(
                      label: 'Email Address',
                      hint: 'name@example.com',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    // submitButton
                    AuthButtonClick(
                      text: 'Send Reset Link',
                      onPressed: () {},
                      icon: Icons.arrow_forward,
                    ),
                    const SizedBox(height: 20),
                    //backButton
                    AuthButtonIcon(
                      text: 'Back to Login',
                      onPressed: () {},
                      icon: Icons.arrow_back,
                    ),
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
