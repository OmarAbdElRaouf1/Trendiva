import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle appTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.neutralColor,
  );

  static TextStyle sectionTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.neutralColor,
  );

  static TextStyle linkText = TextStyle(color: AppColors.primaryColor);

  static TextStyle searchHint = TextStyle(
    fontSize: 14.sp,
    color: Colors.black45,
  );

  static TextStyle bannerTag = TextStyle(
    color: Colors.white70,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bannerTitle = TextStyle(
    color: Colors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bannerSubtitle = TextStyle(
    color: Colors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bannerButton = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );

  static TextStyle categoryLabel = TextStyle(
    fontSize: 16.sp,
    color: AppColors.neutralColor,
  );

  static TextStyle productBrand = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );

  static TextStyle productName = TextStyle(
    fontSize: 16.sp,

    fontWeight: FontWeight.w600,
  );

  static TextStyle productPrice = TextStyle(
    color: AppColors.accentColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
     static TextStyle authLogoTitle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle authSmallText = TextStyle(
    fontSize: 13.sp,
    color: AppColors.greyTextColor,
  );

  static TextStyle authLabel = TextStyle(
    fontSize: 12.sp,
    color: const Color(0xff303030),
    fontWeight: FontWeight.w700,
  );

  static TextStyle authHint = TextStyle(
    color: Colors.black38,
    fontSize: 14.sp,
  );

  static TextStyle authLink = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
  );

  static TextStyle authButton = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
  );

  static TextStyle authBigTitle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 36.sp,
    height: 1.08,
    fontWeight: FontWeight.w900,
  );

  static TextStyle authSubtitle = TextStyle(
    color: AppColors.greyTextColor,
    fontSize: 14.sp,
    height: 1.4,
  );

  static const TextStyle profileAppBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreenColor,
  );

  static const TextStyle profileName = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle profileEmail = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle profileSectionTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textMutedColor,
  );

  static const TextStyle profileItemTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle profileItemDescription = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle profileStatsNumber = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreenColor,
  );

  static const TextStyle profileStatsLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMutedColor,
  );

  static const TextStyle profileLogout = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.logoutRedColor,
  );

  static const TextStyle profileVersion = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle aboutHeroTag = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: AppColors.darkGreenColor,
  );

  static TextStyle aboutHeroTitle = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreenColor,
  );

  static TextStyle aboutHeroTitleBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static const TextStyle aboutSectionTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static const TextStyle aboutBodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textMutedColor,
  );

  static const TextStyle aboutContactTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle aboutContactText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle aboutFooterTag = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle aboutCopyright = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle changePasswordTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static const TextStyle changePasswordSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle passwordRequirementText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle successDialogTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralColor,
  );

  static TextStyle successDialogText = TextStyle(
    fontSize: 16.sp,
    height: 1.4,
    color: AppColors.textMutedColor,
  );
}
