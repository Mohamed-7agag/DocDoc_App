import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class LoginTextSection extends StatelessWidget {
  const LoginTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back",
          style: AppStyle.styleBold24.copyWith(color: AppColors.primaryColor),
        ),
        verticalSpace(8),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: AppStyle.styleRegular14.copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }
}