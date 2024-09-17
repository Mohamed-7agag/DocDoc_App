import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/core/utils/widgets/custom_cherry_toast.dart';
import 'package:doctors_app/core/utils/widgets/custom_error_dialog.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_dialog.dart';
import 'package:doctors_app/features/appointment/presentation/logic/appointment_cubit/appointment_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_state.dart';
import 'package:doctors_app/features/appointment/presentation/views/date_and_time_view.dart';
import 'package:doctors_app/features/appointment/presentation/views/payment_view.dart';
import 'package:doctors_app/features/appointment/presentation/views/summary_view.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/easy_stepper_widget.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentStepper extends StatefulWidget {
  const AppointmentStepper({
    super.key,
    required this.doctorModel,
    required this.index,
  });
  final DoctorModel doctorModel;
  final int index;

  @override
  State<AppointmentStepper> createState() => _AppointmentStepperState();
}

class _AppointmentStepperState extends State<AppointmentStepper> {
  int _activeStep = 0;

  void _setActiveStep(int step) {
    setState(() => _activeStep = step);
  }

  List<Widget> appointmentScreens() {
    return [
      const DateAndTimeView(),
      const PaymentView(),
      SummaryView(doctorModel: widget.doctorModel, index: widget.index),
    ];
  }

  Color textColor(int step) {
    if (step == _activeStep) {
      return AppColors.primaryColor;
    } else if (step < _activeStep) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  EasyStep _easyStepItem(int step, String title, IconData icon) {
    return EasyStep(
      finishIcon: const Icon(Icons.done_rounded),
      icon: Icon(icon, color: Colors.white),
      customTitle: Text(
        title,
        style: AppStyle.styleRegular11.copyWith(
          color: textColor(step),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          EasyStepperWidget(
            activeStep: _activeStep,
            steps: [
              _easyStepItem(0, 'Date & Time', Icons.calendar_month_rounded),
              _easyStepItem(1, 'Payment', Icons.payment_rounded),
              _easyStepItem(2, 'Summary', Icons.summarize_rounded),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return appointmentScreens()[_activeStep];
                      },
                    ),
                  ),
                  BlocListener<AppointmentCubit, AppointmentState>(
                    listenWhen: (previous, current) =>
                        current is AppointmentSuccess ||
                        current is AppointmentFailure ||
                        current is AppointmentLoading,
                    listener: (context, state) {
                      if (state is AppointmentSuccess) {
                        context.pushNamedAndRemoveUntil(
                          Routes.bottomBarViewRoute,
                          predicate: (context) => false,
                        );
                        successCherryToast(
                          context,
                          'Successful booking',
                          state.message,
                        );
                      } else if (state is AppointmentFailure) {
                        //context.pop();
                        customErrorDialog(context, state.errMessage);
                      } else if (state is AppointmentLoading) {
                        customLoadingDialog(context);
                      }
                    },
                    child: BlocBuilder<BookAppointmentInfoCubit,
                        BookAppointmentInfoState>(
                      builder: (context, state) {
                        return CustomButton(
                          title: _activeStep == 2
                              ? 'Book Appointment'
                              : 'Continue',
                          onPressed: () {
                            if (_activeStep == 2) {
                              String startTime = _convertDateAndTime(state);
                              context.read<AppointmentCubit>().bookAppointment(
                                    doctorId: widget.doctorModel.id.toString(),
                                    startTime: startTime,
                                    notes: widget.index.toString(),
                                  );
                            } else {
                              _setActiveStep(_activeStep + 1);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _convertDateAndTime(BookAppointmentInfoState state) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(state.selectedDate!);
    final String startTime = '$formattedDate ${state.selectedTime!}';
    return startTime;
  }
}
