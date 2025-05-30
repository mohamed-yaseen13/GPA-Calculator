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
}
