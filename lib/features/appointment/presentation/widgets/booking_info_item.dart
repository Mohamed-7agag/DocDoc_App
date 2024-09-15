import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/data/models/booking_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BookingInfoItem extends StatelessWidget {
  const BookingInfoItem({super.key, required this.bookingInfoModel});
  final BookingInfoModel bookingInfoModel;
  String convertTime(String time) {
    int hours = int.parse(time.split(':')[0]);
    if (hours > 12) {
      hours = hours - 12;
      return '$hours:${time.split(':')[1]} PM';
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(bookingInfoModel.image),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bookingInfoModel.title, style: AppStyle.styleSemiBold14),
            verticalSpace(3),
            Text(
              DateFormat('EEEE, dd MMMM yyyy').format(bookingInfoModel.date),
              style: AppStyle.styleRegular12.copyWith(color: AppColors.grey70),
            ),
            verticalSpace(3),
            Text(
              convertTime(bookingInfoModel.time),
              style: AppStyle.styleRegular12.copyWith(
                color: AppColors.grey70,
              ),
            ),
          ],
        )
      ],
    );
  }
}
