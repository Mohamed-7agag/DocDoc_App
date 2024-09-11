import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({
    super.key,
    required this.specialityName,
    required this.isSelected,
  });
  final String specialityName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSelected
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.surfaceColor,
                  child: SvgPicture.asset('assets/images/estomic.svg'),
                ),
              )
            : CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.surfaceColor,
                child: SvgPicture.asset('assets/images/estomic.svg'),
              ),
        verticalSpace(12),
        Text(
          specialityName,
          style: AppStyle.styleRegular12.copyWith(
            fontWeight: isSelected ? FontWeightHelper.bold : null,
          ),
        )
      ],
    );
  }
}
