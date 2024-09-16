import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSpecialitiesGridView extends StatelessWidget {
  const AllSpecialitiesGridView({super.key, required this.allSpecialitiesList});
  final List<Datum> allSpecialitiesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'All Specialities'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 16),
            itemCount: allSpecialitiesList.length,
            itemBuilder: (BuildContext context, int index) {
              return DoctorSpecialityItem(
                specialityData: allSpecialitiesList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
