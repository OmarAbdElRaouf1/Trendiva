import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';

/// Hero image with a white gradient at the bottom so the
/// dark headline stays readable over the photo.
class AboutUsHero extends StatelessWidget {
  const AboutUsHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/Image.png', fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.45, 0.75, 1],
                colors: [Colors.transparent, Colors.white70, Colors.white],
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ESTABLISHED 1994', style: AppTextStyles.aboutHeroTag),
                Text('Effortless', style: AppTextStyles.aboutHeroTitle),
                Text('Luxury, Defined.', style: AppTextStyles.aboutHeroTitleBold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
