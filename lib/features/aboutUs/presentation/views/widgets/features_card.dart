import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: context.colors.surfaceMuted,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(icon, color: AppColors.tertiaryColor),
          ),

          SizedBox(height: 16),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: context.colors.primary,
            ),
          ),

          SizedBox(height: 16),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: context.colors.textMuted),
          ),
        ],
      ),
    );
  }
}
