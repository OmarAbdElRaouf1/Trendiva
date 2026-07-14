import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Widget? labelTrailing;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double verticalPadding;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.labelTrailing,
    this.obscureText = false,
    this.keyboardType,
    this.verticalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTrailing == null
            ? Text(label, style: AppTextStyles.authLabel(context))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: AppTextStyles.authLabel(context)),
                  labelTrailing!,
                ],
              ),
        Gap(8.h),
        TextField(
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '•',
          keyboardType: keyboardType,
          style: TextStyle(color: context.colors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.authHint(context),
            prefixIcon: prefixIcon == null
                ? null
                : Icon(prefixIcon, size: 20, color: context.colors.textMuted),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: context.colors.fieldFill,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: verticalPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
