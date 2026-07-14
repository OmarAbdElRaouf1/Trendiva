import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: context.colors.textPrimary),
        ),
        Text('Trendiva', style: AppTextStyles.appTitle(context)),
        Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_rounded,
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
