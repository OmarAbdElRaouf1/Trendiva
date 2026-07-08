import 'package:flutter/material.dart';

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
            color: Color(0xFF5D5F5C),
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
