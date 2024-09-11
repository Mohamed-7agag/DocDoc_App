import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A horizontal list view of doctor specialities.
class DoctorSpecialityHorizontalListView extends StatelessWidget {
  const DoctorSpecialityHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
      buildWhen: (previous, current) =>
          current is SpecializationSuccess ||
          current is SpecializationFailure ||
          current is SpecializationLoading,
      builder: (context, state) {
        return switch (state) {
          SpecializationSuccess() => _SpecialityList(
              specializationDataList: state.specializationModel.data ?? [],
            ),
          SpecializationFailure() => Text(state.errMessage),
          _ => const Center(child: CircularProgressIndicator()),
        };
      },
    );
  }
}

class _SpecialityList extends StatefulWidget {
  const _SpecialityList({required this.specializationDataList});

  final List<Datum> specializationDataList;

  @override
  State<_SpecialityList> createState() => _SpecialityListState();
}

class _SpecialityListState extends State<_SpecialityList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.specializationDataList.asMap().entries.map((entry) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () => _onSpecialityTap(entry.key, entry.value.id),
              child: DoctorSpecialityItem(
                isSelected: _selectedIndex == entry.key,
                specialityName: entry.value.name ?? '',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onSpecialityTap(int index, int? specialityId) {
    setState(() {
      _selectedIndex = index;
    });
    if (specialityId != null) {
      context.read<SpecializationCubit>().getDoctorsList(specialityId);
    }
  }
}
