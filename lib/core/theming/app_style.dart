import 'package:doctors_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle {
  static TextStyle styleBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle styleRegular10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle styleRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle styleSemiBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle styleRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle styleBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle styleBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle styleBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle styleSemiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle styleMedium18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
  );
}
