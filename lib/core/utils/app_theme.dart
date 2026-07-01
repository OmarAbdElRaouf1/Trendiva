import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme() {
    const colorScheme = ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF111827),
      outline: Color(0xFFE5E7EB),
    );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFFDFDFD),
      cardColor: Colors.white,
      inputFillColor: const Color(0xFFF9FAFA),
      mutedTextColor: const Color(0xFF6B7280),
      secondaryTextColor: const Color(0xFF4B5563),
      dividerColor: const Color(0xFFEDEDED),
    );
  }

  static ThemeData darkTheme() {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightSecondaryColor,
      surface: Color(0xFF111827),
      onPrimary: Color(0xFF08130D),
      onSecondary: Color(0xFF0D0D0D),
      onSurface: Color(0xFFF9FAFB),
      outline: Color(0xFF334155),
    );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      cardColor: const Color(0xFF111827),
      inputFillColor: const Color(0xFF18212F),
      mutedTextColor: const Color(0xFF9CA3AF),
      secondaryTextColor: const Color(0xFFD1D5DB),
      dividerColor: const Color(0xFF243041),
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color cardColor,
    required Color inputFillColor,
    required Color mutedTextColor,
    required Color secondaryTextColor,
    required Color dividerColor,
  }) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Cairo',
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dividerColor: dividerColor,
      cardColor: cardColor,
    );

    return baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      textTheme: baseTheme.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        hintStyle: TextStyle(
          color: mutedTextColor,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.2),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          textStyle: const TextStyle(fontFamily: 'Cairo'),
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          mutedTextColor: mutedTextColor,
          secondaryTextColor: secondaryTextColor,
          inputFillColor: inputFillColor,
          socialButtonBorderColor: colorScheme.outline,
          dividerColor: dividerColor,
          checkBoxBorderColor: colorScheme.outline,
        ),
      ],
    );
  }
}

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.mutedTextColor,
    required this.secondaryTextColor,
    required this.inputFillColor,
    required this.socialButtonBorderColor,
    required this.dividerColor,
    required this.checkBoxBorderColor,
  });

  final Color mutedTextColor;
  final Color secondaryTextColor;
  final Color inputFillColor;
  final Color socialButtonBorderColor;
  final Color dividerColor;
  final Color checkBoxBorderColor;

  @override
  AppThemeColors copyWith({
    Color? mutedTextColor,
    Color? secondaryTextColor,
    Color? inputFillColor,
    Color? socialButtonBorderColor,
    Color? dividerColor,
    Color? checkBoxBorderColor,
  }) {
    return AppThemeColors(
      mutedTextColor: mutedTextColor ?? this.mutedTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      inputFillColor: inputFillColor ?? this.inputFillColor,
      socialButtonBorderColor:
          socialButtonBorderColor ?? this.socialButtonBorderColor,
      dividerColor: dividerColor ?? this.dividerColor,
      checkBoxBorderColor: checkBoxBorderColor ?? this.checkBoxBorderColor,
    );
  }

  @override
  AppThemeColors lerp(
    covariant ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      mutedTextColor: Color.lerp(mutedTextColor, other.mutedTextColor, t)!,
      secondaryTextColor: Color.lerp(
        secondaryTextColor,
        other.secondaryTextColor,
        t,
      )!,
      inputFillColor: Color.lerp(inputFillColor, other.inputFillColor, t)!,
      socialButtonBorderColor: Color.lerp(
        socialButtonBorderColor,
        other.socialButtonBorderColor,
        t,
      )!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      checkBoxBorderColor: Color.lerp(
        checkBoxBorderColor,
        other.checkBoxBorderColor,
        t,
      )!,
    );
  }
}
