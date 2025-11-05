import 'package:flutter/material.dart';
import 'package:rockettest/core/theme/elevated_button_theme.dart';
import 'package:rockettest/core/theme/snack_bar_theme.dart';
import 'package:rockettest/core/theme/tab_bar_theme.dart';
import 'package:rockettest/core/theme/text_form_field_theme.dart';
import 'package:rockettest/core/theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.white,

    textTheme: TTextTheme.textTheme,
    snackBarTheme: TSnackBarTheme.snackBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.inputDecorationTheme,
    tabBarTheme: TTabBarThemeData.tabBarTheme,
  );
}
