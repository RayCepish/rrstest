import 'package:flutter/material.dart';
import 'package:rockettest/core/theme/text_theme.dart';

class TTabBarThemeData {
  TTabBarThemeData._();

  static final tabBarTheme = TabBarThemeData(
    labelStyle: TTextTheme.textTheme.headlineMedium,
    unselectedLabelStyle: TTextTheme.textTheme.titleMedium,
    labelColor: Colors.teal,
    unselectedLabelColor: Colors.blueGrey,
    indicatorColor: Colors.teal,
  );
}
