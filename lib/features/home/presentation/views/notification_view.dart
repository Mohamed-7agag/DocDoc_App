import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/presentation/widgets/yesterday_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/today_notification.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Notification'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            verticalSpace(32),
            const TodayNotification(),
            verticalSpace(32),
            const YesterdayNotification(),
          ],
        ),
      ),
    );
  }
}
