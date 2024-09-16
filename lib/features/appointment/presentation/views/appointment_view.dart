import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_cubit.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/appointment_stepper.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView(
      {super.key, required this.doctorModel, required this.index});
  final DoctorModel doctorModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,'Book Appointment'),
      body: Column(
        children: [
          verticalSpace(20),
          BlocProvider(
            create: (context) => BookAppointmentInfoCubit(),
            child: AppointmentStepper(doctorModel: doctorModel, index: index),
          ),
        ],
      ),
    );
  }

  
}
