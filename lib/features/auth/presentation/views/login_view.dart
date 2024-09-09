import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/auth/presentation/widgets/login_form.dart';
import 'package:doctors_app/features/auth/presentation/widgets/login_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/privacy_policy_and_have_not_account_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            verticalSpace(50),
            const LoginTextSection(),
            verticalSpace(36),
            const LoginForm(),
            verticalSpace(60),
            const PrivacyPolicyAndHaveNotAccountSection()
          ],
        ),
      )),
    );
  }
}
