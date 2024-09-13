import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class DoctorDetailsItem extends StatelessWidget {
  const DoctorDetailsItem({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.styleSemiBold16,
        ),
        verticalSpace(6),
        Text(
          value,
          style: AppStyle.styleRegular14.copyWith(color: AppColors.grey70),
        ),
      ],
    );
  }
}
