import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/widgets/speciality_doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityDoctorsView extends StatelessWidget {
  const SpecialityDoctorsView({super.key, required this.specialityData});
  final Datum specialityData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, '${specialityData.name} Doctors'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              SpecialityDoctorsListView(specialityData: specialityData),
            ],
          ),
        ),
      ),
    );
  }
}
