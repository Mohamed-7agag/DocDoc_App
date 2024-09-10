import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityAndSeeAllSection extends StatelessWidget {
  const DoctorSpecialityAndSeeAllSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
          style: AppStyle.styleSemiBold18,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: AppStyle.styleRegular12.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
