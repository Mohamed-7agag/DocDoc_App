import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

import 'today_notification_list_view.dart';

class TodayNotification extends StatelessWidget {
  const TodayNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today',
          style: AppStyle.styleMedium12.copyWith(color: AppColors.grey60),
        ),
        verticalSpace(32),
        const TodayNotificationListView(),
      ],
    );
  }
}
