import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/doctor_details_section.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView(
      {super.key, required this.doctorModel, required this.index});
  final DoctorModel doctorModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, doctorModel.name ?? ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(18),
            DoctorItem(
              doctor: doctorModel,
              index: index,
              isInDetailsView: true,
            ),
            verticalSpace(32),
            DoctorDetailsSection(doctorModel: doctorModel, index: index)
          ],
        ),
      ),
    );
  }
}
