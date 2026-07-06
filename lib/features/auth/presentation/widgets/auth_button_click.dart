import 'package:flutter/material.dart';

class AuthButtonClick extends StatelessWidget {
  const AuthButtonClick({
    super.key,
    required this.text,
    required this.onPressed, required this.icon,
  });
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00342B),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(width: 8),
           Icon(icon, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
