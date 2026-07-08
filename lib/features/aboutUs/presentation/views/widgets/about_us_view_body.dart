import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/about_features_section.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/about_us_footer.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/about_us_hero.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/contact_info_section.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/our_story_section.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AboutUsHero(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(28.h),
                const OurStorySection(),
                Gap(76.h),
                const AboutFeaturesSection(),
                Gap(70.h),
                const ContactInfoSection(),
                Gap(67.h),
                const AboutUsFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
