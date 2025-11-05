import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Colors.teal,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black),
    labelSmall: TextStyle(fontSize: 12.sp, color: Colors.black54),
  );
}
