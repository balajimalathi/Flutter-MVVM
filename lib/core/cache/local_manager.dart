import 'package:buildbase/core/constants/enums/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [LocalManager] is used to handle the [SharedPreferences]
/// In order to use [SharedPreferences] we have to use like
///
/// ```dart
/// final SharedPreferences prefs = await SharedPreferences.getInstance();
/// await prefs.setInt('counter', 10);
/// ```
/// This can be annoying when we don't have to use await for the
/// methods, which use [SharedPreferences]
///
/// By initialized the [LocalManager] in the [runApp] method,
/// we can avoid using async and we can use like,
///
/// ``` dart
/// int counter = LocalManger.instance.getString("counter");
/// ```
///
/// This method will be handy when we are implementing the encrypting and
/// decrypting the values, we are willing to save in the [SharedPreferences]
///
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
      await setBool(Pref.isFirstApp, true);
    }
  }

  Future<void> setString(Pref key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBool(Pref key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setModel(Pref key, dynamic value) async {
    await _preferences!.setString(key.toString(), value.toString());
  }

  Future<void> setRetryCount(int value) async {
    await _preferences!.setInt(Pref.retryCount.toString(), value);
  }

  String getModel(Pref key) =>
      _preferences!.getString(key.toString()) ?? "";

  String getString(Pref key) =>
      _preferences!.getString(key.toString()) ?? "";

  bool getBool(Pref key) =>
      _preferences!.getBool(key.toString()) ?? false;

  int getRetryCount() =>
      _preferences!.getInt(Pref.retryCount.toString()) ?? 1;
}
