import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SpecializationCubit, SpecializationState>(
        buildWhen: (previous, current) =>
            current is DoctorsListSuccess || current is DoctorsListFailure,
        builder: (context, state) {
          return switch (state) {
            DoctorsListSuccess() => _DoctorsList(doctors: state.doctorsList),
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

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctors.length,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (BuildContext context, int index) {
        return DoctorItem(doctor: doctors[index]);
      },
    );
  }
}
