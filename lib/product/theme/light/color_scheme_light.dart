import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color primaryColor = const Color(0xff3a55b4);
  final Color primaryLightColor = const Color(0xff7181e7);
  final Color primaryDarkColor = const Color(0xff002d84);
  final Color secondaryColor = const Color(0xff81de76);
  final Color secondaryLightColor = const Color(0xffb4ffa6);
  final Color secondaryDarkColor = const Color(0xff4eac48);
  final Color primaryTextColor = const Color(0xffffffff);
  final Color background = const Color(0xfffcfcfc);
  final Color secondaryTextColor = const Color(0xff000000);
} 
