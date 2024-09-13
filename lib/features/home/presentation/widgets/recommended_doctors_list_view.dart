import 'package:doctors_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_item.dart';

class RecommendedDoctorsListView extends StatelessWidget {
  const RecommendedDoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SpecializationCubit, SpecializationState>(
        buildWhen: (previous, current) =>
            current is DoctorsListSuccess || current is DoctorsListFailure,
        builder: (context, state) {
          return switch (state) {
            DoctorsListSuccess() =>
              _DoctorsList(doctors: state.recommendedDoctorList),
            DoctorsListFailure() => Center(child: Text(state.errMessage)),
            _ => const CustomLoadingWidget(),
          };
        },
      ),
    );
  }
}

class _DoctorsList extends StatelessWidget {
  const _DoctorsList({required this.doctors});

  final List<DoctorModel?> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: DoctorItem(
            doctor: doctors[index] ?? const DoctorModel(),
            index: (index % 8) + 1,
          ),
        );
      },
    );
  }
}
