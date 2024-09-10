import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorItem extends StatelessWidget {
  const RecommendationDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/test_doctor.png'),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Randy Wigham',
                style: AppStyle.styleBold16,
              ),
              verticalSpace(8),
              Text(
                'General | RSUD Gatot Subroto',
                style: AppStyle.styleRegular12.copyWith(
                  color: AppColors.grey70,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
