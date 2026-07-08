import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

class OurStorySection extends StatelessWidget {
  const OurStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Our Story', style: AppTextStyles.aboutSectionTitle),
        Gap(16.h),
        const Text(
          'Trendiva began with a singular vision: to reconcile the fast-paced '
          'world of fashion with the timeless patience of artisan '
          'craftsmanship. What started in a small atelier has evolved into a '
          'global symbol of sophisticated style.',
          style: AppTextStyles.aboutBodyText,
        ),
        Gap(16.h),
        const Text(
          'Our commitment to effortless luxury is woven into every thread of '
          'our sustainable silk collections. We believe that true fashion '
          "shouldn't cost the earth, which is why our craftsmanship "
          'prioritizes ethical sourcing and zero-waste production cycles.',
          style: AppTextStyles.aboutBodyText,
        ),
      ],
    );
  }
}
