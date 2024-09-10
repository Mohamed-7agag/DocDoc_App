import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

class HaveAccountSection extends StatelessWidget {
  const HaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppStyle.styleRegular12.copyWith(color: AppColors.grey70),
        ),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.loginViewRoute);
          },
          child: Text(
            'Login',
            style: AppStyle.styleRegular12.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}
