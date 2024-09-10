import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class RegisterTextSection extends StatelessWidget {
  const RegisterTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Account",
          style: AppStyle.styleBold24.copyWith(color: AppColors.primaryColor),
        ),
        verticalSpace(8),
        Text(
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
          style: AppStyle.styleRegular14.copyWith(color: AppColors.grey70),
        ),
      ],
    );
  }
}
