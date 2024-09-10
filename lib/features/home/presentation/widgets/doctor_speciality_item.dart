import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.surfaceColor,
          child: SvgPicture.asset('assets/images/estomic.svg'),
        ),
        verticalSpace(12),
        Text(
          'General',
          style: AppStyle.styleRegular12,
        )
      ],
    );
  }
}
