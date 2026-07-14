import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

abstract class AppTheme {
  static ThemeData get light => _build(AppThemeColors.light, Brightness.light);

  static ThemeData get dark => _build(AppThemeColors.dark, Brightness.dark);

  static ThemeData _build(AppThemeColors colors, Brightness brightness) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: colors.scaffoldBackground,
      primaryColor: colors.primary,
      cardColor: colors.surface,
      dividerColor: colors.divider,
      colorScheme: base.colorScheme.copyWith(
        primary: colors.primary,
        secondary: colors.primaryDark,
        surface: colors.surface,
        error: colors.error,
        onSurface: colors.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.scaffoldBackground,
        foregroundColor: colors.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.heading
              : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.heading.withValues(alpha: 0.5)
              : null,
        ),
      ),
    );
  }
}
