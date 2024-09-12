import 'package:flutter/material.dart';

import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/presentation/widgets/recommended_doctors_list_view.dart';

class RecommendedDoctorsSection extends StatelessWidget {
  const RecommendedDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
      'Recommendation Doctor',
      style: AppStyle.styleSemiBold18,
    ),
          verticalSpace(16),
          const RecommendedDoctorsListView(),
        ],
      ),
    );
  }
}
