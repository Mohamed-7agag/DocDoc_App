import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/messages/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  static const List<List<String>> doctorsNames = [
    ['Dr. Randy Wigham', '11:30 PM'],
    ['Dr. Jack Sulivan', '7:50 PM'],
    ['Dr. Hanna Stanton', '5:10 PM'],
    ['Dr. Emery Lubin', '10:15 AM'],
    ['Dr. Mark Smith', '4:40 AM'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Messages'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColors.grey20,
              height: 46,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 16 : 0,
                bottom: index == 4 ? 16 : 0,
              ),
              child: MessageItem(
                index: index + 1,
                doctorName: doctorsNames[index][0],
                time : doctorsNames[index][1],
              ),
            );
          },
        ),
      ),
    );
  }
}
