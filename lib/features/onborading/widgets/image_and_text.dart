import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.2, 4.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset('assets/images/doctor.png'),
        ),
        Positioned(
          bottom: 0,
          child: Text(
            textAlign: TextAlign.center,
            "Best Doctor\nAppointment App",
            style: AppStyle.styleBold32.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
