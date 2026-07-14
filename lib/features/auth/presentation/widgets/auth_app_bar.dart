import 'package:flutter/material.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Trendiva',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: context.colors.heading,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
