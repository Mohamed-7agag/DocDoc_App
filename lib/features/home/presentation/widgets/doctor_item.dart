import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.doctor});
final Doctor doctor;
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
                doctor.name ?? '',
                style: AppStyle.styleBold16,
              ),
              verticalSpace(8),
              Text(
                '${doctor.specialization?.name ?? ''} | ${doctor.degree ?? ''}',
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
