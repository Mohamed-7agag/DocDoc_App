import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_item.dart';

class SpecialityDoctorsListView extends StatelessWidget {
  const SpecialityDoctorsListView({super.key, required this.specialityData});
  final Datum specialityData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: specialityData.doctors?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: DoctorItem(
              doctor: specialityData.doctors![index],
              index: (index % 5) + 1,
            ),
          );
        },
      ),
    );
  }
}
