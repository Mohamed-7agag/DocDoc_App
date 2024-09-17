import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:doctors_app/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildProfileAppBar(context),
      body: Container(
        alignment: Alignment.bottomCenter,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.65,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: const ProfileForm(),
              ),
              Positioned(
                top: -MediaQuery.sizeOf(context).height * 0.09,
                child: Image.asset('assets/images/profile_image.png',
                    width: 140.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
