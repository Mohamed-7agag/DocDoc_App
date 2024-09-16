import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        hintText: 'Search',
        filled: true,
        fillColor: AppColors.surfaceTextColor,
        hintStyle: AppStyle.styleMedium14.copyWith(color: AppColors.grey60),
        prefixIconConstraints: BoxConstraints(maxWidth: 48.w),
        suffixIcon: InkWell(
          onTap: () {
            context.read<SearchCubit>().getSearchedDoctors();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.grey60,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
