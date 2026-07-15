import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalProfileStore {
  static Future<File> _photoFile(String userId) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/profile_photo_$userId.jpg');
  }

  static Future<File?> loadPhoto(String userId) async {
    final file = await _photoFile(userId);
    return file.existsSync() ? file : null;
  }

  static Future<File> savePhoto(String userId, File source) async {
    final file = await _photoFile(userId);
    return source.copy(file.path);
  }

  static Future<void> saveName(String userId, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('local_profile_name_$userId', name);
  }

  static Future<String?> loadName(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('local_profile_name_$userId');
  }

  static Future<void> saveEmail(String userId, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('local_profile_email_$userId', email);
  }

  static Future<String?> loadEmail(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('local_profile_email_$userId');
  }
}
