import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        _buildBottomBarContainer(),
        Positioned(
          bottom: 25,
          child: _buildFloatingSearchButton(),
        ),
      ],
    );
  }

  Widget _buildBottomBarContainer() {
    return Container(
      height: 60.h,
      decoration: _buildBottomBarDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('assets/images/home', 0),
          _buildNavItem('assets/images/message', 1),
          horizontalSpace(55),
          _buildNavItem('assets/images/calendar', 3),
          _buildNavItem('assets/images/profile.png', 4),
        ],
      ),
    );
  }

  BoxDecoration _buildBottomBarDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, -1),
        ),
      ],
    );
  }

  Widget _buildNavItem(String imagePath, int index) {
    final isSelected = selectedIndex == index;
    String imageAsset = '';
    Widget child = const SizedBox();
    if (index == 4) {
      imageAsset = imagePath;
      child = Image.asset(imageAsset,width: 28.w,);
    } else {
      imageAsset = '$imagePath${isSelected ? '_on' : '_off'}.svg';
      child = SvgPicture.asset(imageAsset, width: 27.w);
    }

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: child,
    );
  }

  Widget _buildFloatingSearchButton() {
    return GestureDetector(
      onTap: () => onItemTapped(2),
      child: Container(
        width: 65,
        height: 65,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
        child: Center(
          child: SvgPicture.asset('assets/images/search.svg', width: 28.w),
        ),
      ),
    );
  }
}
