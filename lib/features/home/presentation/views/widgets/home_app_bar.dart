import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppColors.neutralColor),
        ),
        Text('Trendiva', style: AppTextStyles.appTitle),
        Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.neutralColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
