import 'package:buildbase/core/constants/enums/app_theme_enums.dart';
import 'package:buildbase/core/init/cache/locale_manager.dart';
import 'package:buildbase/product/utils/color.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    fontFamily: "RedHatDisplay",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: scaffoldBackground);

ThemeData dark = ThemeData(
    fontFamily: "RedHatDisplay",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: scaffoldBackground);

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
