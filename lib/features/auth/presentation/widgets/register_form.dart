import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_button.dart';
import 'package:doctors_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormField(hintText: 'Email'),
          verticalSpace(16),
          const CustomTextFormField(hintText: 'Password'),
          verticalSpace(16),
          const CustomTextFormField(hintText: 'Your Number'),
          verticalSpace(32),
          CustomButton(title: 'Register', onPressed: () {}),
        ],
      ),
    );
  }
}
