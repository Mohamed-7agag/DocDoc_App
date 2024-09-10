import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/auth/presentation/widgets/privacy_policy_and_have_account_section.dart';
import 'package:doctors_app/features/auth/presentation/widgets/register_form.dart';
import 'package:doctors_app/features/auth/presentation/widgets/register_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(50),
              const RegisterTextSection(),
              verticalSpace(36),
              const RegisterForm(),
              verticalSpace(60),
              const PrivacyPolicyAndHaveAccountSection()
            ],
          ),
        ),
      )),
    );
  }
}
