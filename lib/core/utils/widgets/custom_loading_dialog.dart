import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future customLoadingDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.topSlide,
    padding: EdgeInsets.symmetric(vertical: 40.h),
    body: const CircularProgressIndicator(
      color: AppColors.primaryColor,
    ),
  ).show();
}
