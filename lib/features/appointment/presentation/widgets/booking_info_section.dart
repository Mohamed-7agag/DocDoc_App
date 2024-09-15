import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/presentation/logic/date_and_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingInfoSection extends StatelessWidget {
  const BookingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateAndTimeCubit, DateAndTimeState>(
      builder: (context, state) {
        return  Column(
          children: [
            Text(state.selectedDate?.day.toString() ?? '', style: AppStyle.styleSemiBold16),
            Text(state.selectedType ?? '', style: AppStyle.styleSemiBold16),
          ],
        );
      },
    );
  }
}
