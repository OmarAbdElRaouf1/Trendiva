import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.orderTitle, required this.orderPrice, required this.fontSize, required this.fontWeight, required this.color});
  final String orderTitle;
  final String orderPrice;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          orderTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: context.colors.textMuted,
          ),
        ),
        Spacer(),
        Text(
          orderPrice,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ],
    );
  }
}
