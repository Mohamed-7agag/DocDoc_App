import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:doctors_app/features/appointment/presentation/logic/appointment_cubit/appointment_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/my_appointment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsView extends StatelessWidget {
  const MyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'My Appointment',hasLeading: false),
      body: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is GetMyAppointmentsSuccess) {
            return ListView.builder(
              itemCount: state.myAppointments.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    top: index == 0 ? 16.h : 0,
                  ),
                  child: MyAppointmentItem(
                    myAppointmentResponseModel: state.myAppointments[
                        state.myAppointments.length - 1 - index],
                  ),
                );
              },
            );
          } else if (state is GetMyAppointmentsFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
