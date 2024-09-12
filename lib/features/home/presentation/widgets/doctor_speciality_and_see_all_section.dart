import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityAndSeeAllSection extends StatelessWidget {
  const DoctorSpecialityAndSeeAllSection({super.key, required this.allSpecialitiesList});
final List<Datum> allSpecialitiesList;
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
          onPressed: () {
            context.pushNamed(Routes.allSpecialitiesGridViewRoute,arguments: allSpecialitiesList);
          },
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
