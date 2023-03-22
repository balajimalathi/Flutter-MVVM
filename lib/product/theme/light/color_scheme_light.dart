import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    if (_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color primaryColor = Color(0xff3a55b4);
  final Color primaryLightColor = Color(0xff7181e7);
  final Color primaryDarkColor = Color(0xff002d84);
  final Color secondaryColor = Color(0xff81de76);
  final Color secondaryLightColor = Color(0xffb4ffa6);
  final Color secondaryDarkColor = Color(0xff4eac48);
  final Color primaryTextColor = Color(0xffffffff);
  final Color background = Color(0xfffcfcfc);
  final Color secondaryTextColor = Color(0xff000000); 
} 