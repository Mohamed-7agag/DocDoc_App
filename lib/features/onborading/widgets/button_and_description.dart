import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAndDescription extends StatelessWidget {
  const ButtonAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            style: AppStyle.styleRegular10.copyWith(color: AppColors.grey70),
          ),
          verticalSpace(32),
          CustomButton(
              title: 'Get Started',
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginViewRoute,
                    predicate: (Route<dynamic> route) => false);
              }),
        ],
      ),
    );
  }
}
