import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

abstract class AppTextStyles {
  static TextStyle appTitle(BuildContext context) => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: context.colors.textPrimary,
  );

  static TextStyle sectionTitle(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: context.colors.textPrimary,
  );

  static TextStyle linkText(BuildContext context) =>
      TextStyle(color: context.colors.primary);

  static TextStyle searchHint(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    color: context.colors.textMuted,
  );

  // Sits over a fixed background image; stays constant across themes.
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

  static TextStyle categoryLabel(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    color: context.colors.textPrimary,
  );

  static TextStyle productBrand(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    color: context.colors.textMuted,
    fontWeight: FontWeight.w600,
  );

  static TextStyle productName = TextStyle(
    fontSize: 16.sp,

    fontWeight: FontWeight.w600,
  );

  static TextStyle productPrice(BuildContext context) => TextStyle(
    color: context.colors.primaryDark,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle authLogoTitle(BuildContext context) => TextStyle(
    color: context.colors.primary,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle authSmallText(BuildContext context) => TextStyle(
    fontSize: 13.sp,
    color: context.colors.textMuted,
  );

  static TextStyle authLabel(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    color: context.colors.textPrimary,
    fontWeight: FontWeight.w700,
  );

  static TextStyle authHint(BuildContext context) => TextStyle(
    color: context.colors.textMuted,
    fontSize: 14.sp,
  );

  static TextStyle authLink(BuildContext context) => TextStyle(
    color: context.colors.primary,
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
  );

  // Sits on a fixed primary-colored button; stays constant across themes.
  static TextStyle authButton = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
  );

  static TextStyle authBigTitle(BuildContext context) => TextStyle(
    color: context.colors.primary,
    fontSize: 36.sp,
    height: 1.08,
    fontWeight: FontWeight.w900,
  );

  static TextStyle authSubtitle(BuildContext context) => TextStyle(
    color: context.colors.textMuted,
    fontSize: 14.sp,
    height: 1.4,
  );

  static TextStyle profileAppBarTitle(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: context.colors.heading,
  );

  static TextStyle profileName(BuildContext context) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: context.colors.textPrimary,
  );

  static TextStyle profileEmail(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  static TextStyle profileSectionTitle(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: context.colors.textMuted,
  );

  static TextStyle profileItemTitle(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: context.colors.textPrimary,
  );

  static TextStyle profileItemDescription(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: context.colors.textSecondary,
  );

  static TextStyle profileStatsNumber(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: context.colors.heading,
  );

  static TextStyle profileStatsLabel(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: context.colors.textMuted,
  );

  static TextStyle profileLogout(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: context.colors.error,
  );

  static TextStyle profileVersion(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: context.colors.textSecondary,
  );

  // The About Us hero sits on a fixed white gradient overlay; stays constant.
  static const TextStyle aboutHeroTag = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: Color(0xFF00342B),
  );

  static TextStyle aboutHeroTitle = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF00342B),
  );

  static TextStyle aboutHeroTitleBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff004D40),
  );

  static TextStyle aboutSectionTitle(BuildContext context) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: context.colors.primary,
  );

  static TextStyle aboutBodyText(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: context.colors.textMuted,
  );

  static TextStyle aboutContactTitle(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: context.colors.primary,
  );

  static TextStyle aboutContactText(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.colors.textPrimary,
  );

  static TextStyle aboutFooterTag(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: context.colors.primary,
  );

  static TextStyle aboutCopyright(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: context.colors.textSecondary,
  );

  static TextStyle changePasswordTitle(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: context.colors.primary,
  );

  static TextStyle changePasswordSubtitle(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  static TextStyle passwordRequirementText(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.colors.textPrimary,
  );

  static TextStyle successDialogTitle(BuildContext context) => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: context.colors.textPrimary,
  );

  static TextStyle successDialogText(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    height: 1.4,
    color: context.colors.textMuted,
  );
}
