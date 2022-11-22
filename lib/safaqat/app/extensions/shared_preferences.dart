
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';


extension SharedPreferencesExtensions on SharedPreferences {
  String get token => getString(PrefsKeys.token) ?? '';
  String get id => getString(PrefsKeys.id) ?? '';
}
