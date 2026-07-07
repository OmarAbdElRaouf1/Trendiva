import 'package:flutter/material.dart';

class SplashLogoBox extends StatelessWidget {
  const SplashLogoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Image.asset(
        'assets/images/trendiva_logo.png',
        width: 96,
        height: 96,
        fit: BoxFit.cover,
      ),
    );
  }
}