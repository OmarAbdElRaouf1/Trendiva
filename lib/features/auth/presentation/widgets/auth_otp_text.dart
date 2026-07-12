import 'package:flutter/material.dart';

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
            color: const Color(0xFFE0F2F1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Icon(
            Icons.mark_email_unread_outlined,
            size: 40,
            color: Color(0xFF004D40),
          ),
        ),
        
        const SizedBox(height: 24), 

        const Text(
          'Check your mail',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1B),
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Enter the 6-digit code sent to your\nemail.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF5D5F5C),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}