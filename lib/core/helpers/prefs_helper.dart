import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String selectedScaleKey = 'selected_scale_index';

  static Future<int> getSelectedScaleIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(selectedScaleKey) ?? 1;
  }

  static Future<void> saveCustomScale(Map<String, dynamic> scale) async {
    final prefs = await SharedPreferences.getInstance();
    final String? existing = prefs.getString('custom_scales');
    List<Map<String, dynamic>> customScales = [];
    if (existing != null) {
      customScales = List<Map<String, dynamic>>.from(json.decode(existing));
    }
    customScales.add(scale);
    await prefs.setString('custom_scales', json.encode(customScales));
  }

  static Future<List<Map<String, dynamic>>> loadCustomScales() async {
    final prefs = await SharedPreferences.getInstance();
    final String? existing = prefs.getString('custom_scales');
    List<Map<String, dynamic>> customScales = [];
    if (existing != null) {
      final decoded = json.decode(existing) as List;
      customScales =
          decoded.map<Map<String, dynamic>>((e) {
            final scale =
                (e['scale'] as List)
                    .map<List<String>>((row) => List<String>.from(row))
                    .toList();
            return {'title': e['title'], 'scale': scale};
          }).toList();
    }
    return customScales;
  }

  static Future<void> saveCustomScales(
    List<Map<String, dynamic>> customScales,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('custom_scales', json.encode(customScales));
  }

  static const String noteColorKey = 'note_color';

  static Future<void> setNoteColor(String color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(noteColorKey, color);
  }

  static Future<String?> getNoteColor() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(noteColorKey);
  }

  static const String passwordKey = 'user_password';

  static Future<void> setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordKey, password);
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordKey);
  }

  static const String passwordHintKey = 'password_hint';

  static Future<void> setPasswordHint(String hint) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordHintKey, hint);
  }

  static Future<String?> getPasswordHint() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordHintKey);
  }

  static const String recoveryEmailKey = 'recovery_email';

  static Future<void> setRecoveryEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(recoveryEmailKey, email);
  }

  static Future<String?> getRecoveryEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(recoveryEmailKey);
  }

  static const String passwordEnabledKey = 'password_enabled';

  static Future<void> setPasswordEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(passwordEnabledKey, enabled);
  }

  static Future<bool> isPasswordEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(passwordEnabledKey) ?? false;
  }

  static Future<void> removePassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(passwordKey);
  }
}
