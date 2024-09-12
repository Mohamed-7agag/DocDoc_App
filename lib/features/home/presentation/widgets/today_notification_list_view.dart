import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/data/models/notification_model.dart';
import 'package:doctors_app/features/home/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class TodayNotificationListView extends StatelessWidget {
  const TodayNotificationListView({super.key});

  static const List<NotificationModel> todayNotifications = [
    NotificationModel(
      imagePath: 'assets/images/appointment_success.svg',
      title: 'Appointment Success',
      description:
          "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
      date: '1h',
    ),
    NotificationModel(
      imagePath: 'assets/images/schedule_changed.svg',
      title: 'Schedule Changed',
      description:
          "You have successfully changed your appointment with Dr. Randy Wigham. Don’t forget to active your reminder.",
      date: '4h',
    ),
    NotificationModel(
      imagePath: 'assets/images/video_call_appointment.svg',
      title: 'Video Call Appointment',
      description:
          "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
      date: '7h',
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
