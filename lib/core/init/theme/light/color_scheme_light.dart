import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    if (_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffff);
  final Color gray = Color(0xffa5a6ae);
  final Color lightGray = Color(0xfff7f7f7);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);
  final Color socarBlue = Color(0xfff029EDF);
  final Color socarRed = Color(0xfffE40428);
  final Color socarGreen = Color(0xfff76B82B);
  final Color onError = Color(0xffffc93c);

  final Color boldGreen = Color(0xff27928d);
}


