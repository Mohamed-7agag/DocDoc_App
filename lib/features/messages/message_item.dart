import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.index,
    required this.doctorName,
    required this.time,
  });
  final int index;
  final String doctorName;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/dr$index.png', width: 60.w),
        horizontalSpace(14),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctorName, style: AppStyle.styleSemiBold14),
              verticalSpace(4),
              Text(
                'General Doctor | RSUD Gatot Subroto',
                style: AppStyle.styleRegular10.copyWith(
                  color: AppColors.grey80,
                ),
              ),
              verticalSpace(8),
              Text(
                "Fine, I'll do a check. Does the\npatient have a history of certain\ndiseases?",
                style: AppStyle.styleRegular12.copyWith(
                  color: AppColors.grey70,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              time,
              style: AppStyle.styleRegular10.copyWith(color: AppColors.grey70),
            ),
            verticalSpace(32),
            index < 3
                ? Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '2',
                      style: AppStyle.styleRegular10.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
