import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
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
      appBar: _buildDoctorDetailsAppBar(context, doctorModel.name ?? ''),
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
            DoctorDetailsSection(doctorModel: doctorModel)
          ],
        ),
      ),
    );
  }

  AppBar _buildDoctorDetailsAppBar(BuildContext context, String doctorName) {
    return AppBar(
      title: Text(doctorName, style: AppStyle.styleSemiBold18),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      leadingWidth: 68.w,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        style: IconButton.styleFrom(
          side: const BorderSide(color: AppColors.grey30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
      ),
    );
  }
}
