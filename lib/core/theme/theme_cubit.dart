import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/utils/pref_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialMode);

  static Future<ThemeMode> loadSavedMode() async {
    final saved = await PrefHelper.getThemeMode();
    return saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(next);
    await PrefHelper.saveThemeMode(next.name);
  }
}
