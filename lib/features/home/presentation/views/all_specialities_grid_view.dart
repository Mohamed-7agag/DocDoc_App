import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
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
      appBar: buildAllSpecialitiesAppBar(context),
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

  AppBar buildAllSpecialitiesAppBar(BuildContext context) {
    return AppBar(
      title: Text('All Specialities', style: AppStyle.styleSemiBold18),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
