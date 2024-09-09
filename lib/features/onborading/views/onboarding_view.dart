import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/onborading/widgets/button_and_description.dart';
import 'package:doctors_app/features/onborading/widgets/image_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          verticalSpace(22),
          SvgPicture.asset('assets/images/logo.svg'),
          verticalSpace(40),
          const ImageAndText(),
          verticalSpace(18),
          const ButtonAndDescription()
        ],
      )),
    );
  }
}
