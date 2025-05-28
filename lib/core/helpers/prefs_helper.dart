import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String selectedScaleKey = 'selected_scale_index';

  static Future<int> getSelectedScaleIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(selectedScaleKey) ?? 1;
  }
}
