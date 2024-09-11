import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/doctor_speciality_section.dart';
import '../widgets/home_app_bar_section.dart';
import '../widgets/home_banner_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(12),
          const HomeAppBarSection(),
          const HomeBannerSection(),
          verticalSpace(24),
          const DoctorSpecialitySection(),
          verticalSpace(32),
          const DoctorsListView(),
        ],
      ),
    ));
  }
}
