import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/presentation/widgets/yesterday_notification_list_view.dart';
import 'package:flutter/material.dart';

class YesterdayNotification extends StatelessWidget {
  const YesterdayNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Yesterday',
          style: AppStyle.styleMedium12.copyWith(color: AppColors.grey60),
        ),
        verticalSpace(32),
        const YesterdayNotificationListView(),
      ],
    );
  }
}