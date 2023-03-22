import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    fontFamily: "RedHatDisplay",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F9));

ThemeData dark = ThemeData(
    fontFamily: "RedHatDisplay",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F9));

// class ThemeNotifier extends ChangeNotifier {
//   final String key = "theme";
//   bool? _darkTheme;
//   bool? get darkTheme => _darkTheme;
//
//   ThemeNotifier() {
//     _darkTheme = true;
//     _loadFromPrefs();
//   }
//
//   toggleTheme() {
//     _darkTheme = !_darkTheme!;
//     _saveToPrefs();
//     notifyListeners();
//   }
//
//   _loadFromPrefs() async {
//     _darkTheme = _pref!.getBool(key) ?? true;
//     notifyListeners();
//   }
//
//   _saveToPrefs()async {
//     LocaleManager.instance.setStringValue(AppThemes.LIGHT, "4321");
//     _pref!.setBool(key, _darkTheme!);
//   }
// }
