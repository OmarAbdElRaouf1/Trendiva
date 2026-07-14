import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.numOfStats,
    required this.textOfStats,
  });

  final String numOfStats;
  final String textOfStats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 100,
      decoration: BoxDecoration(
        color: context.colors.surfaceMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(numOfStats, style: AppTextStyles.profileStatsNumber(context)),
          Text(textOfStats, style: AppTextStyles.profileStatsLabel(context)),
        ],
      ),
    );
  }
}
