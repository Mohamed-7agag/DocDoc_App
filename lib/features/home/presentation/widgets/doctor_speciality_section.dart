import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import 'doctor_speciality_and_see_all_section.dart';
import 'doctor_speciality_horizontal_list_view.dart';

class DoctorSpecialitySection extends StatelessWidget {
  const DoctorSpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DoctorSpecialityAndSeeAllSection(),
        verticalSpace(16),
        const DoctorSpecialityHorizontalListView(),
      ],
    );
  }
}
