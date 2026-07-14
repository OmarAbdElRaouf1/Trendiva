import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/contact_info_item.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trendiva HQ', style: AppTextStyles.aboutContactTitle(context)),
        Gap(16.h),
        const ContactInfoItem(
          icon: Icons.location_on_outlined,
          text: '24 Avenue Montaigne, Paris, France',
        ),
        Gap(8.h),
        const ContactInfoItem(
          icon: Icons.mail_outline,
          text: 'concierge@trendiva.com',
        ),
        Gap(8.h),
        const ContactInfoItem(
          icon: Icons.phone_outlined,
          text: '+33 1 42 68 82 00',
        ),
      ],
    );
  }
}
