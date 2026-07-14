import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class PasswordStrength extends StatelessWidget {
  const PasswordStrength({super.key, required this.password});

  final String password;

  static const _labels = ['Weak', 'Weak', 'Fair', 'Good', 'Strong'];
  static const _colors = [
    Color(0xffB3261E),
    Color(0xffB3261E),
    Color(0xffF9A825),
    Color(0xff2E7D32),
    Color(0xff1B5E20),
  ];

  int get _score {
    if (password.isEmpty) return 0;
    var score = 1;
    if (password.length >= 8) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;
    return score.clamp(0, 4);
  }

  @override
  Widget build(BuildContext context) {
    final score = _score;
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
                  color: index < score
                      ? _colors[score]
                      : context.colors.border,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Gap(6.h),
        Text(
          'Password Strength : ${_labels[score]}',
          style: TextStyle(color: context.colors.textMuted),
        ),
      ],
    );
  }
}
