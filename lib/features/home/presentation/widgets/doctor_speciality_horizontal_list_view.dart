import 'package:doctors_app/features/home/presentation/widgets/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityHorizontalListView extends StatelessWidget {
  const DoctorSpecialityHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: const DoctorSpecialityItem(),
            );
          },
        ),
      ),
    );
  }
}
