import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating, this.size = 16});

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final filled = index < rating.round();
        return Icon(
          filled ? Icons.star : Icons.star_border,
          size: size,
          color: context.colors.primary,
        );
      }),
    );
  }
}
