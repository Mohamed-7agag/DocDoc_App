import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem(
      {super.key,
      required this.doctor,
      required this.index,
      this.isInDetailsView = false});
  final DoctorModel doctor;
  final int index;
  final bool? isInDetailsView;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isInDetailsView == true) return;
        context.pushNamed(Routes.doctorDetailsViewRoute,
            arguments: [doctor, index]);
      },
      child: Row(
        children: [
          Image.asset('assets/images/dr$index.png', width: 105.w),
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
                verticalSpace(8),
                Text(
                  'Appoint Price: ${doctor.appointPrice ?? ''}\$',
                  style: AppStyle.styleRegular11.copyWith(
                    color: AppColors.grey70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
