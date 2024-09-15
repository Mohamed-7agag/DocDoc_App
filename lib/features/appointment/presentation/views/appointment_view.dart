import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/presentation/logic/date_and_time_cubit.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/appointment_stepper.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppointmentAppBar(context),
      body: Column(
        children: [
          verticalSpace(20),
          BlocProvider(
            create: (context) => DateAndTimeCubit(),
            child: AppointmentStepper(doctorModel: doctorModel),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppointmentAppBar(BuildContext context) {
    return AppBar(
      title: Text('Book Appointment', style: AppStyle.styleSemiBold18),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      leadingWidth: 68.w,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        style: IconButton.styleFrom(
          side: const BorderSide(color: AppColors.grey30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
      ),
    );
  }
}
