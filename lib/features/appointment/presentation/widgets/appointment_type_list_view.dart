import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/appointment_radio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/appointment_type_item_model.dart';

class AppointmentTypeListView extends StatefulWidget {
  const AppointmentTypeListView({super.key});

  @override
  State<AppointmentTypeListView> createState() =>
      _AppointmentTypeListViewState();
}

class _AppointmentTypeListViewState extends State<AppointmentTypeListView> {
  final List<AppointmentRadioItemModel> appointmentTypeList = [
    const AppointmentRadioItemModel(
      title: 'In Person',
      image: 'assets/images/person.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'Video Call',
      image: 'assets/images/video_call_appointment.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'Phone Call',
      image: 'assets/images/phone.svg',
    ),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: appointmentTypeList.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: AppColors.grey30);
      },
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            context
                .read<BookAppointmentInfoCubit>()
                .setType(appointmentTypeList[index].title);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h).copyWith(
              bottom: index == 2 ? 30.h : 10.h,
            ),
            child: AppointmentRadioItem(
              appointmentTypeItemModel: appointmentTypeList[index],
              isSelected: selectedIndex == index,
            ),
          ),
        );
      },
    );
  }
}
