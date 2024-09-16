import 'package:doctors_app/core/helpers/app_regex.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/data/models/my_appointment_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentItem extends StatelessWidget {
  const MyAppointmentItem(
      {super.key, required this.myAppointmentResponseModel});
  final MyAppointmentResponseModel myAppointmentResponseModel;

  String getdoctorImage(String notes) {
    if (notes == '') {
      return '2';
    }
    else if(AppRegex.hasLowerCase(notes) || AppRegex.hasUpperCase(notes)){
      return '3';
    }
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
            'assets/images/dr${getdoctorImage(myAppointmentResponseModel.notes)}.png',
            width: 105.w),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myAppointmentResponseModel.doctorName,
                style: AppStyle.styleBold16,
              ),
              verticalSpace(8),
              Text(
                '${myAppointmentResponseModel.specializationName} | ${myAppointmentResponseModel.degree}',
                style: AppStyle.styleRegular12.copyWith(
                  color: AppColors.grey70,
                ),
              ),
              verticalSpace(8),
              Text(
                myAppointmentResponseModel.appointmentTime,
                style: AppStyle.styleRegular11.copyWith(
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
