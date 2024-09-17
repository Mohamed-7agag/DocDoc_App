import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar buildProfileAppBar(BuildContext context) {
  return AppBar(
    title: Text('Profile', style: AppStyle.styleSemiBold18),
    centerTitle: true,
    elevation: 0,
    foregroundColor: AppColors.white,
    forceMaterialTransparency: true,
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
    ),
    actions: [
      IconButton(
        onPressed: () {
          context.read<AuthCubit>().logOut();
          context.pushNamedAndRemoveUntil(
            Routes.loginViewRoute,
            predicate: (route) => false,
          );
        },
        icon: const Icon(Icons.logout_rounded, size: 24),
      ),
      horizontalSpace(6),
    ],
  );
}
