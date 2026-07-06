import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key, required this.textOfStats, required this.numOfStats});

  final String numOfStats;
  final String textOfStats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF6F3F2),
        borderRadius: BorderRadiusGeometry.circular(12),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numOfStats.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF00342B),
            ),
          ),
          Text(
            textOfStats,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5D5F5C),
            ),
          ),
        ],
      ),
    );
  }
}
