import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class customField extends StatelessWidget {
  const customField({
    super.key,
    required this.title,
    required this.name,
    this.obscureText = false,
    this.suffixIcon,
  });
  final String title;
  final String name;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 12),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            hintText: name,
            fillColor: AppColors.secondaryColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
