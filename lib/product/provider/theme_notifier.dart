import 'package:buildbase/config.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    fontFamily: Config.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F9));

ThemeData dark = ThemeData(
    fontFamily: Config.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F9));

// class ThemeNotifier extends ChangeNotifier {
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
//     _darkTheme = LocalManager.instance.getBool(key) ?? true;
//     notifyListeners();
//   }
//
//   _saveToPrefs()async {
//     LocalManager.instance.setString(AppThemes.LIGHT, "4321");
//     _pref!.setBool(key, _darkTheme!);
//   }
// }
