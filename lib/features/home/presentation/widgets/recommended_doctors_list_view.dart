import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'recommended_doctor_item.dart';

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
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _DoctorsList extends StatelessWidget {
  const _DoctorsList({required this.doctors});

  final List<Doctor?> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctors.length,
      separatorBuilder: (context, index) => verticalSpace(16),
      itemBuilder: (BuildContext context, int index) {
        return RecommendedDoctorItem(
          doctor: doctors[index] ?? const Doctor(),
          index: (index % 5) + 1,
        );
      },
    );
  }
}
