import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/core/theming/app_colors.dart';

class EasyStepperWidget extends StatelessWidget {
  const EasyStepperWidget({
    super.key,
    required this.activeStep,
    required this.steps,
  });
  final int activeStep;
  final List<EasyStep> steps;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      activeStepBorderColor: Colors.transparent,
      activeStepIconColor: Colors.white,
      activeStepTextColor: AppColors.primaryColor,
      lineStyle: LineStyle(
        lineLength: 70.w,
        finishedLineColor: Colors.green,
        activeLineColor: AppColors.primaryColor,
        lineType: LineType.normal,
        lineThickness: 1.3,
      ),
      direction: Axis.horizontal,
      alignment: Alignment.center,
      activeStepBackgroundColor: AppColors.primaryColor,
      finishedStepBackgroundColor: Colors.green,
      stepRadius: 23,
      showLoadingAnimation: false,
      steps: steps,
    );
  }
}
