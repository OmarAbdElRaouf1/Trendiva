import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class PolicySection extends StatelessWidget {
  const PolicySection({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        const Gap(8),
        Text(
          body,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
