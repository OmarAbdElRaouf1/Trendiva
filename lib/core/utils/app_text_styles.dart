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
}
