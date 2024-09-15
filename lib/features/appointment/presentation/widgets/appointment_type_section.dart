import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

import 'appointment_type_list_view.dart';

class AppointmentTypeSection extends StatelessWidget {
  const AppointmentTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Appointment Type', style: AppStyle.styleSemiBold16),
        verticalSpace(20),
        const AppointmentTypeListView(),
      ],
    );
  }
}
