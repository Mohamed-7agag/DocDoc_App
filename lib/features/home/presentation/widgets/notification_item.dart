import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(notificationModel.imagePath),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationModel.title,
                    style: AppStyle.styleSemiBold14,
                  ),
                  Text(
                    notificationModel.date,
                    style: AppStyle.styleRegular10
                        .copyWith(color: AppColors.grey60),
                  ),
                ],
              ),
              verticalSpace(4),
              Text(
                notificationModel.description,
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
