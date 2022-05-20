import 'package:flutter/material.dart';

import '../../constants/app/app_contansts.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight instance = AppThemeLight._init();

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        primaryColor: _appColorScheme.primary,
        textTheme: buildTextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.black12,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54))),
        scaffoldBackgroundColor: const Color(0xFFFCFCFC),
        fontFamily: ApplicationConstants.FONT_FAMILY,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: colorSchemeLight.secondaryColor),
        tabBarTheme: TabBarTheme(),
        appBarTheme: AppBarTheme(color: colorSchemeLight.primaryColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorSchemeLight.background),
      );

  TextTheme buildTextTheme() {
    return const TextTheme(
      headline1: TextStyle(
          fontSize: 86, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: TextStyle(
          fontSize: 53, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: TextStyle(fontSize: 43, fontWeight: FontWeight.w400),
      headline4: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      headline6: TextStyle(
          fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.25),
      button: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: TextStyle(
          fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );

    // return TextTheme(
    //   headline1: textThemeLight.headline1,
    //   headline2: textThemeLight.headline1,
    //   overline: textThemeLight.overline,
    // );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.primaryColor,
      secondary: colorSchemeLight.secondaryColor,
      surface: Colors.red[900]!,
      background: Colors.white,
      error: colorSchemeLight.primaryTextColor,

      onPrimary: colorSchemeLight.primaryTextColor,
      onSecondary: colorSchemeLight.secondaryTextColor,
      onSurface: colorSchemeLight.secondaryColor, // xx
      onBackground: colorSchemeLight.secondaryColor,
      onError: colorSchemeLight.primaryTextColor, //xx
      brightness: Brightness.light,
    );
  }
}


// <!--?xml version="1.0" encoding="UTF-8"?-->
// <resources>
//   <color name="primaryColor">#3a55b4</color>
//   <color name="primaryLightColor">#7181e7</color>
//   <color name="primaryDarkColor">#002d84</color>
//   <color name="secondaryColor">#81de76</color>
//   <color name="secondaryLightColor">#b4ffa6</color>
//   <color name="secondaryDarkColor">#4eac48</color>
//   <color name="primaryTextColor">#ffffff</color>
//   <color name="secondaryTextColor">#000000</color>
// </resources>