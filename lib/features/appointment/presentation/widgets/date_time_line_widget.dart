import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeLineWidget extends StatelessWidget {
  const DateTimeLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        padding: EdgeInsets.zero,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      initialDate: DateTime.now(),
      activeColor: AppColors.primaryColor,
      dayProps:
          EasyDayProps(dayStructure: DayStructure.dayStrDayNum, height: 90.h),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
    );
  }
}
