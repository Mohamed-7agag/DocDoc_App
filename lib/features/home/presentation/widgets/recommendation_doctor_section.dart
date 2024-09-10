import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import 'recommendation_doctor_list_view.dart';
import 'recommendation_doctors_and_see_all_section.dart';

class RecommendationDoctorSection extends StatelessWidget {
  const RecommendationDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const RecommendationDoctorAndSeeAllSection(),
          verticalSpace(12),
          const RecommendationDoctorListView()
        ],
      ),
    );
  }
}
