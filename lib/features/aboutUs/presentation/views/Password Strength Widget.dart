import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class PasswordStrength extends StatelessWidget {
  const PasswordStrength({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            4,
            (index) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 4),
                height: 5,
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColors.neutralColor
                      : AppColors.tertiaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          "Password Strength : Weak",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
