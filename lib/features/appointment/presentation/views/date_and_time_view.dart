import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/appointment_type_section.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/choose_time_widget.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/date_time_line_widget.dart';
import 'package:flutter/material.dart';

class DateAndTimeView extends StatelessWidget {
  const DateAndTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DateTimeLineWidget(),
          verticalSpace(24),
          const ChooseTimeWidget(),
          verticalSpace(24),
          const AppointmentTypeSection(),
        ],
      ),
    );
  }
}
