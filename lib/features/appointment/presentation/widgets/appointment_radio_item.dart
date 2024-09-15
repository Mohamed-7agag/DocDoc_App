import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/appointment_type_item_model.dart';

class AppointmentRadioItem extends StatelessWidget {
  const AppointmentRadioItem({
    super.key,
    required this.appointmentTypeItemModel,
    required this.isSelected,
  });
  final AppointmentRadioItemModel appointmentTypeItemModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: SvgPicture.asset(appointmentTypeItemModel.image),
        ),
        horizontalSpace(12),
        // Text
        Text(
          appointmentTypeItemModel.title,
          style: AppStyle.styleRegular14,
        ),
        const Spacer(),
        // Radio Button
        Container(
          width: 18,
          height: 18,
          margin: EdgeInsets.only(right: 12.w),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          child: isSelected
              ? const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
