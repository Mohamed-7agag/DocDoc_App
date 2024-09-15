import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:flutter/material.dart';

import '../widgets/booking_info_section.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: AppStyle.styleSemiBold16),
        verticalSpace(20),
        const BookingInfoSection(),
      ],
    );
  }
}
