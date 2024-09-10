import 'package:doctors_app/core/utils/widgets/custom_cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/core/utils/widgets/custom_error_dialog.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_dialog.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:doctors_app/features/auth/presentation/widgets/custom_text_form_field.dart';

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
          verticalSpace(40),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthRegisterSuccess) {
                successCherryToast(context, 'Success', 'Success Registeration');
                context.pushReplacementNamed(Routes.loginViewRoute);
              } else if (state is AuthRegisterFailure) {
                context.pop();
                customErrorDialog(context, state.errMessage);
              } else if (state is AuthRegisterLoading) {
                customLoadingDialog(context);
              }
            },
            child: CustomButton(
              title: 'Register',
              onPressed: () {
                context.read<AuthCubit>().register();
              },
            ),
          ),
        ],
      ),
    );
  }
}
