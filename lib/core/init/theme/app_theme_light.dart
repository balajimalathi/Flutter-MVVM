import 'package:flutter/material.dart';

import '../../constants/app/app_contansts.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight instance = AppThemeLight._init();

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: buildTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black12,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54))),
        scaffoldBackgroundColor: Color(0xFFFAFAFA),
        fontFamily: ApplicationConstants.FONT_FAMILY,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: colorSchemeLight.lightGray),
        // tabBarTheme: TabBarTheme(
        //   labelPadding: insets.lowPaddingAll,
        //   unselectedLabelStyle:
        //       textThemeLight.overline.copyWith(color: colorSchemeLight.gray),
        // ),
        appBarTheme: AppBarTheme(color: colorSchemeLight.boldGreen),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorSchemeLight.lightGray),
      );

  TextTheme buildTextTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline1,
      overline: textThemeLight.overline,
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: Colors.white, //xx
      secondary: colorSchemeLight.socarGreen,
      secondaryVariant: colorSchemeLight.boldGreen, //xx
      surface: Colors.red[900]!,
      background: Colors.white, //xx // green accent idi
      error: colorSchemeLight.socarRed,
      onPrimary: Colors.white,
      onSecondary: Colors.black, //xx
      onSurface: colorSchemeLight.socarBlue, // xx
      onBackground: Colors.black12,
      onError: colorSchemeLight.onError, //xx
      brightness: Brightness.light,
    );
  }
}
