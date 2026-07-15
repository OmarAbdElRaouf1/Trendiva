import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class ContactDetailItem extends StatelessWidget {
  const ContactDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.colors.chipTint,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: context.colors.primary, size: 20),
        ),
        Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textMuted,
                ),
              ),
              const Gap(2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
