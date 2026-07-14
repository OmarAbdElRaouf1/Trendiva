import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.shape = BoxShape.rectangle,
  });

  const ShimmerBox.circle({super.key, required double size})
    : width = size,
      height = size,
      borderRadius = 0,
      shape = BoxShape.circle;

  final double? width;
  final double? height;
  final double borderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.colors.surface,
        shape: shape,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.circular(borderRadius),
      ),
    );
  }
}
