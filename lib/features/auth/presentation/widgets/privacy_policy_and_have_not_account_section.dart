import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyAndHaveNotAccountSection extends StatelessWidget {
  const PrivacyPolicyAndHaveNotAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.regular,
              color: AppColors.moreLightGrey,
            ),
            children: [
              TextSpan(
                text: 'By logging, you agree to our ',
                style: AppStyle.styleRegular12,
              ),
              TextSpan(
                text: 'Terms & Conditions',
                style: AppStyle.styleRegular12.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.bold),
              ),
              TextSpan(
                text: ' and ',
                style: AppStyle.styleRegular12,
              ),
              TextSpan(
                text: 'PrivacyPolicy.',
                style: AppStyle.styleRegular12.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.bold),
              ),
            ],
          ),
        ),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style:
                  AppStyle.styleRegular12.copyWith(color: AppColors.lightGrey),
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
