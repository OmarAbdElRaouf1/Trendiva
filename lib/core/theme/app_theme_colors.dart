import 'package:flutter/material.dart';

/// Semantic colors that adapt between the light and dark app themes.
/// Access via `context.colors` (see [AppColorsX]).
class AppThemeColors {
  const AppThemeColors({
    required this.primary,
    required this.primaryDark,
    required this.heading,
    required this.scaffoldBackground,
    required this.surface,
    required this.surfaceMuted,
    required this.fieldFill,
    required this.chip,
    required this.chipTint,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.divider,
    required this.border,
    required this.error,
    required this.errorBackground,
  });

  /// Brand teal used for buttons, links and prices.
  final Color primary;

  /// Deeper teal accent (secondary brand tone).
  final Color primaryDark;

  /// Heading/title accent (was the fixed dark-green color).
  final Color heading;

  final Color scaffoldBackground;

  /// Card / container surfaces (was hardcoded white).
  final Color surface;

  /// Muted panel surfaces (stats cards, input backgrounds).
  final Color surfaceMuted;

  /// Text field fill color.
  final Color fieldFill;

  /// Small pill/badge background.
  final Color chip;

  /// Tinted pill background (e.g. icon badges).
  final Color chipTint;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  final Color divider;
  final Color border;

  final Color error;
  final Color errorBackground;

  static const light = AppThemeColors(
    primary: Color(0xff004D40),
    primaryDark: Color(0xff003D34),
    heading: Color(0xFF00342B),
    scaffoldBackground: Color(0xFFFBFAF8),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF6F3F2),
    fieldFill: Color(0xffF7F3F2),
    chip: Color(0xFFEEEEEE),
    chipTint: Color(0xFFE0F2F1),
    textPrimary: Color(0xFF1C1B1B),
    textSecondary: Color(0xFF3F4945),
    textMuted: Color(0xFF5D5F5C),
    divider: Color(0xFFE5E2E1),
    border: Color(0xFFD7CCC8),
    error: Color(0xFFBA1A1A),
    errorBackground: Color(0xFFFDF0EE),
  );

  static const dark = AppThemeColors(
    primary: Color(0xFF4DB6AC),
    primaryDark: Color(0xFF26A69A),
    heading: Color(0xFF80CBC4),
    scaffoldBackground: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    surfaceMuted: Color(0xFF232323),
    fieldFill: Color(0xFF262626),
    chip: Color(0xFF2A2A2A),
    chipTint: Color(0xFF17332E),
    textPrimary: Color(0xFFF2F2F2),
    textSecondary: Color(0xFFC8CCC9),
    textMuted: Color(0xFFA0A4A1),
    divider: Color(0xFF33362F),
    border: Color(0xFF3A3733),
    error: Color(0xFFFFB4AB),
    errorBackground: Color(0xFF3A2422),
  );
}

extension AppColorsX on BuildContext {
  AppThemeColors get colors => Theme.of(this).brightness == Brightness.dark
      ? AppThemeColors.dark
      : AppThemeColors.light;
}
