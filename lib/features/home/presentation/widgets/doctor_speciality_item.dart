import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({super.key, required this.specialityData});
  final Datum specialityData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.specialityDoctorsViewRoute,
            arguments: specialityData);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.surfaceColor,
            child: Image.asset(
              'assets/images/${specialityData.name}.png',
              width: 35.w,
            ),
          ),
          verticalSpace(12),
          Text(specialityData.name ?? '', style: AppStyle.styleRegular12),
        ],
      ),
    );
  }
}
