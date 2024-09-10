import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;
  OutlineInputBorder buildBorder(Color borderSideColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: borderSideColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isNullOrEmpty()) {
          return 'This field is required';
        }
        return null;
      },
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyle.styleRegular14.copyWith(
          color: AppColors.textFormHintColor,
        ),
        border: buildBorder(Colors.transparent),
        enabledBorder: buildBorder(AppColors.textFormBorderColor),
        focusedBorder: buildBorder(AppColors.primaryColor),
        errorBorder: buildBorder(Colors.red),
      ),
    );
  }
}
