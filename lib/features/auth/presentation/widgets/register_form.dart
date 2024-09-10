import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:doctors_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Name',
            controller: context.read<AuthCubit>().nameController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Email',
            controller: context.read<AuthCubit>().emailController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Your Number',
            controller: context.read<AuthCubit>().phoneController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Password',
            controller: context.read<AuthCubit>().passwordController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Confirm Password',
            controller: context.read<AuthCubit>().confirmPasswordController,
          ),
          verticalSpace(32),
          CustomButton(
            title: 'Register',
            onPressed: () {
              context.read<AuthCubit>().register();
            },
          ),
        ],
      ),
    );
  }
}
