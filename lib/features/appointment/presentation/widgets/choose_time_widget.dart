import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/choose_time_grid_view.dart';
import 'package:flutter/material.dart';

class ChooseTimeWidget extends StatelessWidget {
  const ChooseTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available time', style: AppStyle.styleSemiBold16),
        verticalSpace(20),
        const ChooseTimeGridView()
      ],
    );
  }
}
