import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/data/models/booking_info_model.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_state.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/booking_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BookingInfoSection extends StatelessWidget {
  const BookingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentInfoCubit, BookAppointmentInfoState>(
      builder: (context, state) {
        return Column(
          children: [
            BookingInfoItem(
              bookingInfoModel: BookingInfoModel(
                title: 'Date & Time',
                date: state.selectedDate!,
                time: state.selectedTime!,
                image: 'assets/images/schedule_changed.svg',
              ),
            ),
            const Divider(
              color: AppColors.grey20,
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/appointment_type.svg'),
                horizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Appointment Type', style: AppStyle.styleSemiBold14),
                    verticalSpace(3),
                    Text(
                      state.selectedType.toString(),
                      style: AppStyle.styleRegular12
                          .copyWith(color: AppColors.grey70),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              color: AppColors.grey20,
              height: 40,
            ),
          ],
        );
      },
    );
  }
}
