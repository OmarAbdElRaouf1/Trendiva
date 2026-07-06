import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AuthPasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;
  final IconData? prefixIcon;
  final Widget? labelTrailing;
  final double verticalPadding;

  const AuthPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    this.prefixIcon,
    this.labelTrailing,
    this.verticalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label,
      hint: hint,
      controller: controller,
      prefixIcon: prefixIcon,
      obscureText: obscureText,
      labelTrailing: labelTrailing,
      verticalPadding: verticalPadding,
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20,
          color: Colors.black54,
        ),
      ),
    );
  }
}
