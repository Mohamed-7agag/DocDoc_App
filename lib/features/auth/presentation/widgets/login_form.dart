import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/core/utils/widgets/custom_error_dialog.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_dialog.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:doctors_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            controller: context.read<AuthCubit>().emailController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Password',
            controller: context.read<AuthCubit>().passwordController,
          ),
          verticalSpace(40),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccess) {
                context.pushNamedAndRemoveUntil(
                  Routes.bottomBarViewRoute,
                  predicate: (route) => false,
                );
              } else if (state is AuthLoginFailure) {
                context.pop();
                customErrorDialog(context, state.errMessage);
              } else if (state is AuthLoginLoading) {
                customLoadingDialog(context);
              }
            },
            child: CustomButton(
              title: 'Login',
              onPressed: () {
                context.read<AuthCubit>().login();
              },
            ),
          ),
        ],
      ),
    );
  }
}
