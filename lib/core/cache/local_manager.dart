import 'package:buildbase/core/constants/enums/preferences_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManager {
  static final LocalManager instance = LocalManager._init();

  SharedPreferences? _preferences;

  LocalManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    await _preferences!.clear();
    if (_preferences != null) {
      await setBoolValue(PreferencesKeys.isFirstApp, true);
    }
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setModelValue(PreferencesKeys key, dynamic value) async {
    await _preferences!.setString(key.toString(), value.toString());
  }

  Future<void> setRetryCount(int value) async {
    await _preferences!.setInt(PreferencesKeys.retryCount.toString(), value);
  }

  String getModelValue(PreferencesKeys key) =>
      _preferences!.getString(key.toString()) ?? "";

  String getStringValue(PreferencesKeys key) =>
      _preferences!.getString(key.toString()) ?? "";

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;

  int getRetryCount() =>
      _preferences!.getInt(PreferencesKeys.retryCount.toString()) ?? 1;
}
