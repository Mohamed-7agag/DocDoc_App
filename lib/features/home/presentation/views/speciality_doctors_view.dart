import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/widgets/speciality_doctors_list_view.dart';

class SpecialityDoctorsView extends StatelessWidget {
  const SpecialityDoctorsView({super.key, required this.specialityData});
  final Datum specialityData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSpecialityDoctorsAppBar(context, specialityData.name ?? ''),
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

  AppBar _buildSpecialityDoctorsAppBar(
      BuildContext context, String specialityName) {
    return AppBar(
      title: Text('$specialityName Doctors', style: AppStyle.styleSemiBold18),
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      titleSpacing: 0,
      leadingWidth: 68.w,
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
