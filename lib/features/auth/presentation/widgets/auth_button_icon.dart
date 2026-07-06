import 'package:flutter/material.dart';

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
      icon:  Icon(icon, size: 16, color: Color(0xFF004333)),
      label: Text(
        text,
        style: TextStyle(color: Color(0xFF004333), fontWeight: FontWeight.bold),
      ),
    );
  }
}
