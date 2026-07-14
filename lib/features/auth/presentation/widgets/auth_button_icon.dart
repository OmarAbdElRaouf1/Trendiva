import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class AuthButtonIcon extends StatelessWidget {
  const AuthButtonIcon({
    super.key,
    required this.text,
    required this.onPressed, required this.icon,
  });
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: context.colors.heading),
      label: Text(
        text,
        style: TextStyle(color: context.colors.heading, fontWeight: FontWeight.bold),
      ),
    );
  }
}
