import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  final double size;
  final double radius;

  const AuthLogo({
    super.key,
    this.size = 58,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        'assets/images/trendiva_logo.png',
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}