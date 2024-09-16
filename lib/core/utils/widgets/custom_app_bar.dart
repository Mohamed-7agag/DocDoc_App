import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title, style: AppStyle.styleSemiBold18),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.white,
    leadingWidth: 68.w,
    forceMaterialTransparency: true,
    leading: IconButton(
      onPressed: () => context.pop(),
      style: IconButton.styleFrom(
        side: const BorderSide(color: AppColors.grey30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
    ),
  );
}
