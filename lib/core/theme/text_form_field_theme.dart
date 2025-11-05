import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.teal.shade100,

    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.blueGrey),
    labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
    floatingLabelStyle: TextStyle(
      fontSize: 15.sp,
      color: Colors.blueGrey.shade700,
    ),

    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.teal, width: 1.5.w),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.red, width: 1.5.w),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.red, width: 1.5.w),
    ),
  );
}
