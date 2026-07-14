import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists user-chosen profile customizations (photo, display name/email
/// overrides) on-device only — nothing here is synced to the backend.
abstract class LocalProfileStore {
  static const String _photoFileName = 'profile_photo.jpg';
  static const String _nameKey = 'local_profile_name';
  static const String _emailKey = 'local_profile_email';

  static Future<File> _photoFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_photoFileName');
  }

  static Future<File?> loadPhoto() async {
    final file = await _photoFile();
    return file.existsSync() ? file : null;
  }

  static Future<File> savePhoto(File source) async {
    final file = await _photoFile();
    return source.copy(file.path);
  }

  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }

  static Future<String?> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
  }

  static Future<String?> loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }
}
