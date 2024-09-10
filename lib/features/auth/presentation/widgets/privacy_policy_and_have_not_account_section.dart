import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/theming/font_weight_helper.dart';
import 'package:doctors_app/features/auth/presentation/widgets/privacy_policy_text.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyAndHaveNotAccountSection extends StatelessWidget {
  const PrivacyPolicyAndHaveNotAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PrivacyPolicyText(),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: AppStyle.styleRegular12.copyWith(color: AppColors.grey70),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.registerViewRoute);
              },
              child: Text(
                'Sign Up',
                style: AppStyle.styleRegular12.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
