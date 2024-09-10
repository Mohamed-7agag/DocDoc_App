import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Omar!', style: AppStyle.styleBold18),
            verticalSpace(2),
            Text('How Are you Today?',
                style:
                    AppStyle.styleRegular11.copyWith(color: AppColors.grey80)),
          ],
        ),
        CircleAvatar(
          backgroundColor: AppColors.grey20,
          radius: 24,
          child: SvgPicture.asset('assets/images/notification.svg'),
        ),
      ],
    );
  }
}
