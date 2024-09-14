import 'package:doctors_app/features/appointment/presentation/widgets/choose_time_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseTimeGridView extends StatefulWidget {
  const ChooseTimeGridView({super.key});

  @override
  State<ChooseTimeGridView> createState() => _ChooseTimeGridViewState();
}

class _ChooseTimeGridViewState extends State<ChooseTimeGridView> {
  static const List<String> timeList = [
    '10:00 AM',
    '5:00 PM',
    '11:00 AM',
    '7:00 PM',
    '12:00 AM',
    '8:00 PM',
  ];

  int currentTimeindex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        mainAxisExtent: 60.h,
      ),
      shrinkWrap: true,
      itemCount: timeList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() => currentTimeindex = index);
          },
          child: ChooseTimeGridViewItem(
            currentTimeindex: currentTimeindex,
            gridIndex: index,
            timeList: timeList,
          ),
        );
      },
    );
  }
}
