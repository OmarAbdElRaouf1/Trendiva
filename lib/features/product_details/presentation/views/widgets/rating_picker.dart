import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class RatingPicker extends StatelessWidget {
  const RatingPicker({
    super.key,
    required this.rating,
    required this.onChanged,
    this.size = 36,
  });

  final int rating;
  final ValueChanged<int> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        final filled = starValue <= rating;
        return GestureDetector(
          onTap: () => onChanged(starValue),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              filled ? Icons.star : Icons.star_border,
              size: size,
              color: context.colors.primary,
            ),
          ),
        );
      }),
    );
  }
}
