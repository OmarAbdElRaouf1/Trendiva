import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle appTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.neutralColor,
  );

  static TextStyle sectionTitle = TextStyle(
    fontSize: 20,
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
    color: Color(0xff003D34),
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
}
