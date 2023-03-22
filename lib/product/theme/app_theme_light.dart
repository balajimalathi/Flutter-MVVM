import 'package:flutter/material.dart';

import '../../core/constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight instance = AppThemeLight._init();

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        primaryColor: _appColorScheme.primary,
        textTheme: buildTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFCFCFC),
        fontFamily: ApplicationConstants.fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: _appColorScheme.primary, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: _appColorScheme.primary.withOpacity(0.5), width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide:
                BorderSide(color: Colors.red.withOpacity(0.4), width: 2.0),
          ),
          labelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: Colors.blue.withOpacity(0.8), width: 2.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 8.0),
        ),
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: colorSchemeLight.secondaryColor),
        tabBarTheme: const TabBarTheme(),
        appBarTheme: AppBarTheme(color: colorSchemeLight.primaryColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorSchemeLight.background),
      );

  TextTheme buildTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
          fontSize: 86, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontSize: 53, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 43, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.25),
      labelLarge: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: TextStyle(
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
      onSurface: colorSchemeLight.secondaryColor,
      // xx
      onBackground: colorSchemeLight.secondaryColor,
      onError: colorSchemeLight.primaryTextColor,
      //xx
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
