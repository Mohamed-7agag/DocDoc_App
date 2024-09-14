import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsSection extends StatelessWidget {
  const DoctorDetailsSection({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: AppStyle.styleSemiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          verticalSpace(3),
          Container(
            width: 80.w,
            height: 2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryColor,
            ),
          ),
          verticalSpace(24),
          DoctorDetailsItem(
            title: 'Email',
            value: doctorModel.email ?? '',
          ),
          verticalSpace(24),
          DoctorDetailsItem(
            title: 'Phone Number',
            value: doctorModel.phone ?? '',
          ),
          verticalSpace(24),
          DoctorDetailsItem(
            title: 'Address',
            value: doctorModel.address ?? '',
          ),
          verticalSpace(24),
          DoctorDetailsItem(
            title: 'Working Time',
            value: '${doctorModel.startTime} - ${doctorModel.endTime}',
          ),
          verticalSpace(24),
          DoctorDetailsItem(
            title: 'City And Governrate',
            value:
                '${doctorModel.city?.name ?? ''} - ${doctorModel.city?.governrate?.name ?? ''}',
          ),
          const Spacer(),
          CustomButton(
              title: 'Make An Appointment',
              onPressed: () {
                context.pushNamed(Routes.appointmentViewRoute);
              }),
          verticalSpace(20),
        ],
      ),
    );
  }
}
