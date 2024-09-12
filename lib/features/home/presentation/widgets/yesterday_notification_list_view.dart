import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/data/models/notification_model.dart';
import 'package:doctors_app/features/home/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class YesterdayNotificationListView extends StatelessWidget {
  const YesterdayNotificationListView({super.key});

  static const List<NotificationModel> todayNotifications = [
    NotificationModel(
      imagePath: 'assets/images/appointment_cancelled.svg',
      title: 'Appointment Cancelled ',
      description:
          "You have successfully canceled your appointment  with Dr. Randy Wigham. 50% of the funds will be returned to your account.",
      date: '1d',
    ),
    NotificationModel(
      imagePath: 'assets/images/new_payment_added.svg',
      title: 'New Payment Added!',
      description: "Your payment has been successfully linked with Docdoc.",
      date: '1d',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todayNotifications.length,
      separatorBuilder: (context, index) => verticalSpace(24),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return NotificationItem(notificationModel: todayNotifications[index]);
      },
    );
  }
}
