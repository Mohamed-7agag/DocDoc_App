import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:doctors_app/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';
import 'package:doctors_app/features/profile/presentation/widgets/profile_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(120),
              ProfileTextField(
                label: 'Name',
                controller: context.read<ProfileCubit>().nameController,
                value: state.profileResponseModel.data?.first.name ?? '',
              ),
              verticalSpace(24),
              ProfileTextField(
                label: 'Email',
                controller: context.read<ProfileCubit>().emailController,
                value: state.profileResponseModel.data?.first.email ?? '',
              ),
              verticalSpace(24),
              ProfileTextField(
                label: 'Phone Number',
                controller: context.read<ProfileCubit>().phoneController,
                value: state.profileResponseModel.data?.first.phone ?? '',
              ),
              verticalSpace(60),
              CustomButton(title: 'Save', onPressed: () {}),
            ],
          );
        } else if (state is ProfileFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }
}
