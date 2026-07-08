import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class ContactInfoItem extends StatelessWidget {
  const ContactInfoItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Gap(8.w),
        Expanded(child: Text(text, style: AppTextStyles.aboutContactText)),
      ],
    );
  }
}
