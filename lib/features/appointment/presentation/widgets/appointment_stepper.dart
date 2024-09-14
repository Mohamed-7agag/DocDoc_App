import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/features/appointment/presentation/views/date_and_time_view.dart';
import 'package:doctors_app/features/appointment/presentation/views/payment_view.dart';
import 'package:doctors_app/features/appointment/presentation/views/summary_view.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/easy_stepper_widget.dart';

class AppointmentStepper extends StatefulWidget {
  const AppointmentStepper({super.key});

  @override
  State<AppointmentStepper> createState() => _AppointmentStepperState();
}

class _AppointmentStepperState extends State<AppointmentStepper> {
  int _activeStep = 0;

  void _setActiveStep(int step) {
    setState(() {
      _activeStep = step;
    });
  }

  List<Widget> appointmentScreens = [
    const DateAndTimeView(),
    const PaymentView(),
    const SummaryView(),
  ];

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
                children: [
                  appointmentScreens[_activeStep],
                  const Spacer(),
                  CustomButton(
                    title: _activeStep == 2 ? 'Book Appointment' : 'Next',
                    onPressed: () {
                      if (_activeStep == 2) {
                        // todo : go to appointment done screen
                      } else {
                        _setActiveStep(_activeStep + 1);
                      }
                    },
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
}
