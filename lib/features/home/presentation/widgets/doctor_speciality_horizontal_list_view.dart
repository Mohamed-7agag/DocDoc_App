import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_speciality_item.dart';

class DoctorSpecialityHorizontalListView extends StatelessWidget {
  const DoctorSpecialityHorizontalListView(
      {super.key, required this.specializationDataList});
  final List<Datum> specializationDataList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: specializationDataList.asMap().entries.map((entry) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: DoctorSpecialityItem(
              specialityData: entry.value,
            ),
          );
        }).toList(),
      ),
    );
  }
}
