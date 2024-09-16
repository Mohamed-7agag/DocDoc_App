import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

class ChooseTimeGridViewItem extends StatelessWidget {
  const ChooseTimeGridViewItem({
    super.key,
    required this.currentTimeindex,
    required this.timeList, required this.gridIndex,
  });

  final int currentTimeindex;
  final int gridIndex;
  final List<String> timeList;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: currentTimeindex == gridIndex ? AppColors.primaryColor : null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              currentTimeindex == gridIndex ? Colors.transparent : AppColors.grey30,
        ),
      ),
      child: Text(
        timeList[gridIndex],
        style: AppStyle.styleRegular14.copyWith(
          color: currentTimeindex == gridIndex ? AppColors.white : AppColors.grey60,
          fontWeight:
              currentTimeindex == gridIndex ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
