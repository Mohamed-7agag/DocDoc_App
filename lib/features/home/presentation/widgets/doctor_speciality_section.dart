import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_speciality_and_see_all_section.dart';
import 'doctor_speciality_horizontal_list_view.dart';

class DoctorSpecialitySection extends StatelessWidget {
  const DoctorSpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
        buildWhen: (previous, current) =>
            current is SpecializationSuccess ||
            current is SpecializationFailure ||
            current is SpecializationLoading,
        builder: (context, state) {
          if (state is SpecializationSuccess) {
            return Column(
              children: [
                DoctorSpecialityAndSeeAllSection(
                    allSpecialitiesList: state.specializationModel.data ?? []),
                verticalSpace(12),
                DoctorSpecialityHorizontalListView(
                  specializationDataList: state.specializationModel.data ?? [],
                ),
              ],
            );
          } else if (state is SpecializationFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        });
  }
}
