import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_cubit.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/booking_info_section.dart';

class SummaryView extends StatelessWidget {
  const SummaryView(
      {super.key, required this.doctorModel, required this.index});
  final DoctorModel doctorModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Booking Information', style: AppStyle.styleSemiBold16),
          verticalSpace(20),
          const BookingInfoSection(),
          verticalSpace(12),
          Text('Doctor Information', style: AppStyle.styleSemiBold16),
          verticalSpace(20),
          DoctorItem(doctor: doctorModel, index: index, isInDetailsView: true),
          verticalSpace(24),
          Text('Payment Information', style: AppStyle.styleSemiBold16),
          verticalSpace(20),
          BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
            builder: (context, state) {
              return Row(
                children: [
                  SvgPicture.asset(state.selectedPaymentType?.image ?? ''),
                  horizontalSpace(12),
                  Text(
                    state.selectedPaymentType?.title ?? '',
                    style: AppStyle.styleMedium14,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
